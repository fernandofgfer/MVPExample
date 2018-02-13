//
//  ApiClient.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation

final class ApiClient {
    func load(url: URL, completion: @escaping (Data?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else{
                completion(nil)
                return
            }
            completion(data)
            }.resume()
    }
}
