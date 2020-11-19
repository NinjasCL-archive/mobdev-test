import Foundation

public typealias DogCeoEndpoint = String

public final class DogCeoEndpoints {
    public static let base = "https://dog.ceo/api"
    
    public static func root() -> DogCeoEndpoint {
        return DogCeoEndpoints.base
    }

    public static func list() -> DogCeoEndpoint {
        return "\(DogCeoEndpoints.root())/breeds/list".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }

    public static func images(for breed:DogBreedName) -> DogCeoEndpoint {
        return "\(DogCeoEndpoints.root())/breed/\(breed)/images".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    public static func randomImage(for breed:DogBreedName) -> DogCeoEndpoint {
        return "\(DogCeoEndpoints.images(for: breed))/random"
    }
}
