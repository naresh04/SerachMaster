//
//  SerachPhotoMasterTests.swift
//  SerachPhotoMasterTests
//
//  Created by Naresh on 2/20/24.
//

@testable import FlickerSearch

class FlickerSearchTests: XCTestCase {
    var mockService: MockFlickrService?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      
    }

    override func tearDownWithError() throws {
        mockService = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFlickerSearchAPI(){
        
        mockService = MockFlickrService()
        mockService?.searchPhotos(withQuery: "Test", completion: { result in
            XCTAssertEqual(result?.first?.title, "Noord-Amerikaans")
            XCTAssertEqual(result?.first?.title, "Noord-Amerikaans")
        })
    }
    
    func testFlickerSearchAPIFail(){
        mockService = MockFlickrService(faluire: true)
        mockService?.searchPhotos(withQuery: "Test", completion: { result in
            XCTAssertNil(result)
        })
        
    }
}
