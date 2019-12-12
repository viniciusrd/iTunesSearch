//
//  SearchBookTest.swift
//  iTunesSearchApiTests
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class ServiceTest: XCTestCase {

    let urlImage = "https://is2-ssl.mzstatic.com/image/thumb/Publication123/v4/59/4c/6a/594c6a5a-45e4-4e9b-0f90-ecf59a8ccb48/source/100x100bb.jpg"
    let searchPath = "/search"
    var bookAPI: iTunesAPIProtocol = iTunesAPIDefault()
    
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
        var queryParameters = URLComponents()
        let parameters = ["term": "testKey",
                          "entity": "testValue"
                         ]
        for item in parameters{
            if  queryParameters.queryItems == nil {
                queryParameters.queryItems = [URLQueryItem(name: item.key, value: item.value)]
            }else{
               queryParameters.queryItems?.append(URLQueryItem(name: item.key, value: item.value))
            }
        }
        let request = APIRequest(method: .get, path: searchPath, parametersBody: nil, parametersURL: parameters, headers: nil)
        XCTAssertEqual(request.getUrlParameter(), queryParameters.queryItems, "The URLQueryItem should be equals")
    }
    
    func testSuccessImageViewLoader(){
        let imageExpectation = expectation(description: "Image Expectation")
        let image = UIImageView()
        image.setImageFromURL(toUrl: urlImage) { (complete) in
            DispatchQueue.main.async {
                switch complete{
                case true:
                    imageExpectation.fulfill()
                case false:
                    XCTAssert(false, "Could not load image from url")
                }
            }
        }
        waitForExpectations(timeout: 25) { (error) in
            XCTAssertNotNil(image.image, "Could not load image from url")
        }
    }
    
    func testFailureImageViewLoaderWithEmptyUrl()  {
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
    
    func testFailureImageViewLoader() {
        let image = UIImageView()
        image.setImageFromURL(toUrl: "https://github.com") { (complete) in
            switch complete{
            case false:
                XCTAssertEqual(complete, false, "Could not load image from url")
            default:
                XCTAssert(false, "Could load image from invalid url")
            }
        }
    }
    
    func testHttpMethodRequest(){
        var request: Request.HTTPMethod = .get
        XCTAssert(request.rawValue == "GET", "HTTP method should be GET")
        request = .post
        XCTAssert(request.rawValue == "POST", "HTTP method should be POST")
        request = .delete
        XCTAssert(request.rawValue == "DELETE", "HTTP method should be DELETE")
        request = .patch
        XCTAssert(request.rawValue == "PATCH", "HTTP method should be PATCH")
        request = .put
        XCTAssert(request.rawValue == "PUT", "HTTP method should be PUT")
    }
    
    func testAPIiTunesWhenReturnSuccess(){
        let testExpectation = expectation(description: "Expectation to result http status code 200")
        let searchText = "Swift"
        let parameters = ["term": searchText,
                         "entity": "ibook"
                         ]
        var responseHTTP: HTTPURLResponse?
        let request = APIRequest(method: .get, path: searchPath, parametersBody: nil, parametersURL: parameters, headers: nil)
        request.makeRequest { (data, response, error) in
            guard ((response as? HTTPURLResponse) != nil) else {
                XCTAssertNil(response, "Response should be not nil")
                return
            }
            responseHTTP = response as? HTTPURLResponse
            XCTAssert(responseHTTP!.statusCode == 200, "")
            testExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            XCTAssertNotNil(responseHTTP)
        }
    }
    
    func testAPISearchBookWhenReturnSuccess()  {
        let testExpectation = expectation(description: "Expectation to result return list of Book")
        var iBooks: iTunesResponse?
        bookAPI.searchBook(forSearchText: "swift") { (response) in
            switch response{
            case .success(let response):
                XCTAssertNotNil(response, "response should be not nil")
                iBooks = response
                testExpectation.fulfill()
            case .failure(let error):
                XCTAssertNil(error, "error should be nil")
            }
        }
        waitForExpectations(timeout: 20) { (error) in
            XCTAssertNotNil(iBooks)
        }
    }
    

}
