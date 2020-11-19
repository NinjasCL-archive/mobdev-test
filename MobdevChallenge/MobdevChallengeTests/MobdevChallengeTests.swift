

import XCTest
import API
@testable import MobdevChallenge

class MobdevChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testThatDogDetailTitleIsCorrect() throws {
        let presenter = DogDetailPresenter(with:API.DogCeoQueries.shared, breed: "terrier chileno")
        XCTAssertEqual(presenter.title, "Terrier Chileno")
    }
    
    func testThatDogDetailCellHeightIsCorrect() throws {
        let presenter = DogDetailPresenter(with: API.DogCeoQueries.shared, breed: "quiltro")
        XCTAssertEqual(presenter.dogCellHeight, 200)
    }
    
    func testThatDogDetailBreedIsCorrect() throws {
        let breed = "quiltro"
        let presenter = DogDetailPresenter(with: API.DogCeoQueries.shared, breed: breed)
        XCTAssertEqual(presenter.breed, breed)
    }

}
