import Foundation
import Shared
import Alamofire

public final class DogCeoQueries: DogCeoAPIService {
    
    public static let shared = DogCeoQueries()
    
    public func list(success: DogCeoListResultHandler? = nil, error: DogCeoErrorResultHandler? = nil) {
        
        Shared.log.trace("Dog Ceo API: list func triggered")
        
        let endpoint = DogCeoEndpoints.list()
        Shared.log.debug("\(endpoint)")
        
        AF.request(endpoint).validate().responseDecodable(of: DogBreedJson.self) { response in
            Shared.log.trace("Response: \(response)")
            
            guard let items = response.value else {
                error?(response.error)
                return
            }
            success?(items)
        }
    }

    public func images(_ params: DogCeoImagesQueryParams, success: DogCeoImagesResultHandler? = nil, error: DogCeoErrorResultHandler? = nil) {
        
        Shared.log.trace("Dog Ceo API: images func triggered")
        
        let endpoint = DogCeoEndpoints.images(for: params.breed)
        Shared.log.debug("\(endpoint)")
        
        AF.request(endpoint).validate().responseDecodable(of: DogImageJson.self) { response in
            Shared.log.trace("Response: \(response)")
            guard let items = response.value else {
                error?(response.error)
                return
            }
            
            var dogs = [Dog]()
            
            for item in items.images! {
                let dog = Dog(with: params.breed, image: item)
                dogs.append(dog)
            }
            
            success?(dogs)
        }
    }
    
    public func randomImage(_ params: DogCeoImagesQueryParams , success: DogCeoImagesRandomResultHandler? = nil, error: DogCeoErrorResultHandler? = nil) {
        
        Shared.log.trace("Dog Ceo API: Random image func triggered")
        
        let endpoint = DogCeoEndpoints.randomImage(for: params.breed)
        Shared.log.debug("\(endpoint)")
        
        AF.request(endpoint).validate().responseDecodable(of: DogImageRandomJson.self) { response in
            Shared.log.trace("Response: \(response)")
            guard let item = response.value else {
                error?(response.error)
                return
            }

            let dog = Dog(with: params.breed, image: item.image!)
            success?(dog)
            
        }
    }
}
