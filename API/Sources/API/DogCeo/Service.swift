import Foundation

public typealias DogCeoListResultHandler = (DogBreedJson) -> Void
public typealias DogCeoImagesResultHandler = ([Dog]) -> Void
public typealias DogCeoImagesRandomResultHandler = (Dog) -> Void
public typealias DogCeoImageDownloaderResultHandler = (Data) -> Void
public typealias DogCeoErrorResultHandler = ((Any?) -> Void)

public protocol DogCeoAPIService {
    func list(success: DogCeoListResultHandler?, error: DogCeoErrorResultHandler?)
    func images(_ params: DogCeoImagesQueryParams, success: DogCeoImagesResultHandler?, error: DogCeoErrorResultHandler?)
    func randomImage(_ params: DogCeoImagesQueryParams , success: DogCeoImagesRandomResultHandler?, error: DogCeoErrorResultHandler?)
}
