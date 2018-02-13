//
//  PhotoUtils.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation

class PhotoUtils {
    static func  loadPhoto(imageURL: String?) -> Data? {
        if let url = URL(string: (imageURL ?? "")) {
            return try? Data(contentsOf: url)
        }
        return nil
    }
}
