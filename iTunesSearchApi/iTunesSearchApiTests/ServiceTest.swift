//
//  SearchBookTest.swift
//  iTunesSearchApiTests
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import XCTest
@testable import iTunesSearchApi

class ServiceTest: XCTestCase {

    let urlImage = "https://is2-ssl.mzstatic.com/image/thumb/Publication123/v4/59/4c/6a/594c6a5a-45e4-4e9b-0f90-ecf59a8ccb48/source/60x60bb.jpg"
    let searchPath = "/search"
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestUrl() {
        let request = APIRequest(method: .get, path: searchPath, parametersBody: nil, parametersURL: nil, headers: nil)
        XCTAssertNotNil(request, "Could not instantiate APIRequest")
        let url = "https://itunes.apple.com/search"
        XCTAssertEqual(request.getUrl(), url, "The url should be a \(url)")
    }
    
    func testParametersURL()  {
        let key = "testParameter"
        let value = "testValue"
        let parameters = [key: value]
        let queryParameters = [URLQueryItem(name: key, value: value)]
        let request = APIRequest(method: .get, path: searchPath, parametersBody: nil, parametersURL: parameters, headers: nil)
        XCTAssertEqual(request.getUrlParameter(), queryParameters, "The URLQueryItem should be equals")
    }
    
    func testSuccessImageViewLoader(){
        let image = UIImageView()
        image.setImageFromURL(toUrl: urlImage) { (complete) in
            switch complete{
            case true:
                XCTAssertNotNil(image.image, "Could not load image from url")
            case false:
                XCTAssert(false, "Could not load image from url")
            }
        }
        
    }
    
    func testFailureImageViewLoader() {
        let image = UIImageView()
        image.setImageFromURL(toUrl: "") { (complete) in
            switch complete{
            case false:
                XCTAssertEqual(complete, false, "Could not load image from url")
            default:
                XCTAssert(false, "Could load image from invalid url")
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
