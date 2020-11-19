import Foundation
import Kingfisher
import Shared

public typealias DogBreedName = String
public typealias DogImageURL = String
public typealias DogImageData = Data

public final class Dog {
    public var breed: DogBreedName
    public var imageURL: DogImageURL
    public var image: DogImageData?
    
    var typeName: String {
        return "\(self.breed): \(self.imageURL)"
    }
    
    public init(with breed:DogBreedName, image:DogImageURL) {
        self.breed = breed
        self.imageURL = image
    }
    
    public func fetchImage(success:DogCeoImageDownloaderResultHandler? = nil, error:DogCeoErrorResultHandler? = nil) {

        guard let url = URL(string:self.imageURL) else {
            Shared.log.warning("No valid url for image.")
            return
        }
        
        let resource = Kingfisher.ImageResource(downloadURL: url)
        
        Shared.log.trace("Downloading Image: \(url)")
        
        KingfisherManager.shared.retrieveImage(with: resource) { result in
            switch result {
                case .success(let value):
                    // This is needed because we can test the api using the macos device
                    // and avoid using the simulator if possible.
                    #if os(macOS)
                        let data = value.image.tiffRepresentation
                    #else
                        let data = value.image.pngData()
                    #endif
                    
                    self.image = data
                    success?(data ?? Data.empty)
                
                case .failure(let err):
                    Shared.log.error("\(String(describing:error))")
                    error?(err)
            }
        }
    }
}
