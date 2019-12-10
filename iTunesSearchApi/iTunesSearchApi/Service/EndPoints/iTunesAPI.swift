//
//  iTunesAPI.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 09/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import Foundation
protocol iTunesAPIProtocol {
    func searchBook(forSearchText text: String, completion: @escaping APIRequest.ResponseBlock<iTunesResponse>)
}

class iTunesAPIDefault: iTunesAPIProtocol {
    func searchBook(forSearchText text: String, completion: @escaping APIRequest.ResponseBlock<iTunesResponse>) {
        let parameters = ["term": text,
                          "entity": "ibook"
                         ]
        let request = APIRequest(method: .get, path: "/search", parametersBody: nil, parametersURL: parameters, headers: nil)
        request.makeRequest { (data, response, error) in
            print(response as Any)
            guard let httpResponse = (response as? HTTPURLResponse), let data = data, error == nil else {
                completion(.failure(Request.standardError))
                return
            }
            if httpResponse.statusCode == 200{
                guard let result = try? JSONDecoder().decode(iTunesResponse.self, from: data) else {
                    completion(.failure(Request.standardError))
                    return
                }
                completion(.success(result))
            } else  {
                guard let dataParameters = try? JSONSerialization.jsonObject(with: data, options: []), let parameters = dataParameters as? [String: Any], let message = parameters["errors"] as? [String] else {
                    completion(.failure(Request.standardError))
                    return
                }
                let error: NSError = NSError(domain: "iTunesAppError", code: httpResponse.statusCode, userInfo: ["Error":message[0]])
                completion(.failure(error))
            }
        }
    }
}
