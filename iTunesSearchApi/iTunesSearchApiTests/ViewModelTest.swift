//
//  ViewModelTest.swift
//  iTunesSearchApiTests
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import XCTest
@testable import iTunesSearchApi
class ViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHeartTextHomeViewModel() {
        let headerText = "Search"
        let viewModel = HomeViewModel()
        XCTAssertEqual(viewModel.headerText, headerText,"")
    }
    
    func testHeartTextLibraryViewModel(){
        let headerText = "In Your Library"
        let viewModel = LibraryViewModel()
        XCTAssertEqual(viewModel.headerText, headerText,"The header text should be In Your Library")
    }
    
    func testHeartTextLibraryDetailsViewModel(){
        let book: Book? = DataReader.loadJson(filename: "BookResponse")
        guard book != nil else {
            XCTAssert(false, "Could not load book object")
            return
        }
        let headerText = book!.trackCensoredName
        let viewModel = LibraryDetailsViewModel(withBook: book!)
        XCTAssertEqual(viewModel.headerText, headerText,"The header text should be In Your Library")
    }

    func testLibraryDetailsViewModelBook()  {
        let book: Book? = DataReader.loadJson(filename: "BookResponse")
        guard book != nil else {
            XCTAssert(false, "Could not load book object")
            return
        }
        let viewModel = LibraryDetailsViewModel(withBook: book!)
        XCTAssertNotNil(viewModel.book, "Could not nil Object")
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
