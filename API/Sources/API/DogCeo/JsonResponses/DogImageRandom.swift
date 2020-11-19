import Foundation

public struct DogImageRandomJson: Codable {
    let image: DogImageURL?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "message"
        case status
    }
}
