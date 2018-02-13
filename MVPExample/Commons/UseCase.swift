//
//  UseCase.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation

final class UseCase {

    func getListOfSuperHeroes(url: String,completion: @escaping ([SuperHero]?) -> ()) {
        if let url = URL(string: url) {
            ApiClient().load(url: url, completion: { (data) in
                if let _ = data {
                    //Because the response contains a "superheroes" key, but we don't need it
                    completion(try! JSONDecoder().decode([String: [SuperHero]].self, from: data!).first?.value)
                }
            })
        }
    }
}

