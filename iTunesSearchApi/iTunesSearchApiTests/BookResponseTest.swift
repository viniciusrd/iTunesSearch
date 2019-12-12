//
//  BookResponseTest.swift
//  iTunesSearchApiTests
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class BookResponseTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInvalidJson(){
        let itunesResponse: iTunesResponse? = DataReader.loadJson(filename: "")
        XCTAssertNil(itunesResponse, "The Book should be nil")
    }

    func testItunesResponse()  {
        let itunesResponse: iTunesResponse? = DataReader.loadJson(filename: "iTunesResponse")
        XCTAssertNotNil(itunesResponse, "The itunesResponse should be not nil")
    }
    
    func testBookResponse() {
        let book: Book? = DataReader.loadJson(filename: "BookResponse")
        XCTAssertNotNil(book, "The Book should be not nil")
    }
}
