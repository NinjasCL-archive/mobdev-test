import Foundation
import API

public protocol DogDetailPresenterDelegate {
    var presenter: DogDetailPresenter { get set }
    var dogs : [Dog] { get set }
    var breed: DogBreedName {get set}
    
    func refresh() -> Void
}

public final class DogDetailPresenter {
    
    var service: API.DogCeoAPIService
    var delegate:  DogDetailPresenterDelegate?
    var breed: DogBreedName?
    
    var title : String {
        get {
            return (self.breed ?? "").capitalized
        }
    }
    
    let dogCellIdentifier = "DogImageCell"
    let dogCellHeight : Float = 200
    
    
    public init(with service:API.DogCeoAPIService, delegate: DogDetailPresenterDelegate? = nil, breed:API.DogBreedName? = "") {
        self.service = service
        self.delegate = delegate
        self.breed = breed
    }
    
    public func fetch() {
        let params = API.DogCeoImagesQueryParams(with: self.breed ?? "")
        self.service.images(params, success: { result in
            self.delegate?.dogs = result
            self.delegate?.refresh()
        }, error:nil)
    }
    
}
