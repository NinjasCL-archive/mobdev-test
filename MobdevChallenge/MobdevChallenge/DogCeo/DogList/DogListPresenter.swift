
import Foundation
import API

public protocol DogBreedsListPresenterDelegate {
    var presenter: DogBreedsListPresenter { get set }
    var breeds : [String] { get set }
    func refresh() -> Void
}

public final class DogBreedsListPresenter {
    
    var service: API.DogCeoAPIService
    var delegate:  DogBreedsListPresenterDelegate?
    
    let dogCellIdentifier: String = "DogCell"
    let dogDetailIdentifier: String = "DogDetailController"
    
    public init(with service:API.DogCeoAPIService, delegate: DogBreedsListPresenterDelegate? = nil) {
        self.service = service
        self.delegate = delegate
    }
    
    public func fetch() {
        self.service.list(success: { result in
            self.delegate?.breeds = result.breeds ?? []
            self.delegate?.refresh()
        }, error: nil)
    }
}
