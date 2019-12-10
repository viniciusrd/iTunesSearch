//
//  Request.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
struct Request {
    static let standardError = NSError(domain: "iTunesAppError", code: 999, userInfo: ["Error":"Não foi possível conectar. Verifique se o app está atualizado ou tente novamente em alguns minutos."])
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    enum Response<T> {
        case success(T?)
        case failure(Error?)
    }
}

class APIRequest {
    typealias ResponseBlock<T> = (_ reponse: Request.Response<T>) -> Void
    private let scheme = Constants.scheme
    private let host = Constants.itunesHost
    private var path: String
    private let httpMethod: Request.HTTPMethod
    private var extraHeader: [String: String]?
    private var parametersBody: [String: String]?
    private var parametersURL: [String: String]?
    
    init(method: Request.HTTPMethod, path: String, parametersBody:[String:String]? = nil, parametersURL:[String:String]? = nil, headers:[String: String]? = nil ) {
        self.httpMethod = method
        self.path = path
        self.extraHeader = headers
        self.parametersBody = parametersBody
        self.parametersURL = parametersURL
    }
    
    func makeRequest(completion: @escaping (Data?, URLResponse?, Error?) -> Void)  {
    
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        if let parameters = parametersURL{
            for item in parameters{
                if  urlComponents.queryItems == nil {
                    urlComponents.queryItems = [URLQueryItem(name: item.key, value: item.value)]
                }else{
                   urlComponents.queryItems?.append(URLQueryItem(name: item.key, value: item.value))
                }
            }
        }
        
        guard let urlRequest = urlComponents.url else { return }
        var request = URLRequest(url: urlRequest)
        request.httpMethod = httpMethod.rawValue
        
        
        
        if let httpBody = parametersBody {
            request.httpBody = try? JSONSerialization.data(withJSONObject: httpBody)
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        if let extraHeader = extraHeader{
            request.allHTTPHeaderFields = extraHeader
        }
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        let session = URLSession(configuration: URLSessionConfiguration.default)
        print(request as Any)
        session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
            print(response as Any)
            }.resume()
    }
}
