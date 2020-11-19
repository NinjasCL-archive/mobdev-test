import Foundation

public struct DogImageJson: Codable {
    let images: [DogImageURL]?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case images = "message"
        case status
    }
}
