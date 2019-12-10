//
//  ImageViewLoader.swift
//  iTunesSearchApi
//
//  Created by Vinicius Rodrigues on 10/12/19.
//  Copyright © 2019 Vinicius Rodrigues. All rights reserved.
//

import UIKit

extension UIImageView{
    
    func setImageFromURL(toUrl url: String , completion: @escaping (Bool) -> Void)  {
        guard let imageURL = URL(string: url) else { return }
        setImage(imageURL) { (complete) in
            completion(complete)
        }
    }
    
    
    fileprivate func setImage(_ url: URL, completion: @escaping (Bool) -> Void){
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            print(response as Any)
            guard let data = data, error == nil,
                let image = UIImage(data: data) else { return }
            completion(true)
            DispatchQueue.main.async() {
                self.image = image
            }
        }
        dataTask.resume()
    }
}
