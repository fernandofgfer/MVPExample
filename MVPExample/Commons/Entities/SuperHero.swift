//
//  SuperHero.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation

struct SuperHero: Decodable {
    let name: String?
    let photo: String?
    let realName: String?
    let height: String?
    let power: String?
    let abilities: String?
    let groups: String?

    func getName() -> String? {
        return name
    }

    func getPhoto() -> String? {
        return photo
    }

    func getRealName() -> String? {
        return realName
    }

    func getHeight() -> String? {
        return height
    }

    func getPower() -> String? {
        return power
    }

    func getAbilities() -> String? {
        return abilities
    }

    func getGroups() -> String? {
        return groups
    }
}

extension SuperHero: Equatable {
    static func ==(lhs: SuperHero, rhs: SuperHero) -> Bool {
        return lhs.name == rhs.name
    }
}
