import XCTest
import Shared
@testable import API

final class APITests: XCTestCase {
    func testThatDogCeoListReturnResults() {
        
       let timeout : TimeInterval = 10
       let expectation = XCTestExpectation(description: "Get Dog List")
        
        API.dogs.list(success: { response in
            Shared.log.trace("\(response)")
            XCTAssert(response.breeds!.count > 0)
            expectation.fulfill()
        }, error: { _ in
            expectation.fulfill()
            XCTAssert(false, "List should return results")
        })
        
        wait(for: [expectation], timeout: timeout)
    }
    
    func testThatDogCeoImagesReturnResults() {
        
       let timeout : TimeInterval = 10
       let expectation = XCTestExpectation(description: "Get Dog Image List")
        
        API.dogs.list(success: { response in
            let breed = response.breeds!.first!
            let params = API.DogCeoImagesQueryParams(with: breed)
            API.dogs.images(params, success: { result in
                let dog = result.first!
                XCTAssertNotNil(dog.breed)
                XCTAssertNotNil(dog.imageURL)
                XCTAssert(result.count > 0)
                
                expectation.fulfill()
            }, error: { _ in
                expectation.fulfill()
                XCTAssert(false, "Images should return results")
            })
            
        }, error: { _ in
            expectation.fulfill()
            XCTAssert(false, "List should return results")
        })
        
        wait(for: [expectation], timeout: timeout)
    }
    
    func testThatDogCeoImagesRandomReturnResults() {
        
       let timeout : TimeInterval = 10
       let expectation = XCTestExpectation(description: "Get Dog Image List")
        
        API.dogs.list(success: { response in
            let name = response.breeds!.first!
            let params = API.DogCeoImagesQueryParams(with: name)
            API.dogs.randomImage(params, success: { result in
                
                XCTAssertNotNil(result.breed)
                XCTAssertNotNil(result.imageURL)
                
                result.fetchImage (success: { data in
                        XCTAssertNotNil(data)
                        XCTAssertNotEqual(data, Data.empty)
                        expectation.fulfill()
                    }, error: { _ in
                        expectation.fulfill()
                        XCTAssert(false, "Image Download should return data")
                    }
                )
                
            }, error: { _ in
                expectation.fulfill()
                XCTAssert(false, "Images should return results")
            })
            
        }, error: { _ in
            expectation.fulfill()
            XCTAssert(false, "List should return results")
        })
        
        wait(for: [expectation], timeout: timeout)
    }

    static var allTests = [
        ("testThatDogCeoListReturnResults", testThatDogCeoListReturnResults),
        ("testThatDogCeoImagesReturnResults", testThatDogCeoImagesReturnResults),
        ("testThatDogCeoImagesRandomReturnResults", testThatDogCeoImagesRandomReturnResults)
    ]
}
