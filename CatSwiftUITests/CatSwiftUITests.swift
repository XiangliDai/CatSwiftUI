//
//  CatSwiftUITests.swift
//  CatSwiftUITests
//
//  Created by Xiangli on 6/19/22.
//

import XCTest
import Combine
@testable import CatSwiftUI

class CatSwiftUITests: XCTestCase {

    override func tearDown() {
        subscriptions = []
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_breeds_success(){
        let result = Result<[Breed], APIError>
                    .success([Breed.example2(), Breed.example1()])
        let manager = BreedManager(service: APIMockService(result: result))
        
        let promise = expectation(description: "getting breeds")
        
        manager.$breeds.sink { breeds in
            if breeds.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
    
    func test_getting_breeds_error(){
        let result = Result<[Breed], APIError>
            .failure(APIError.badURL)
        let manager = BreedManager(service: APIMockService(result: result))
        
        let promise = expectation(description: "show error message")
        
        manager.$breeds.sink { breeds in
            if !breeds.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        manager.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }

}
