import Foundation

public struct DogBreedJson: Codable {
    public let breeds: [DogBreedName]?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case breeds = "message"
        case status
    }
}
