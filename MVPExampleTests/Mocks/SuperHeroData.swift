//
//  SuperHeroData.swift
//  MVPExampleTests
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation
@testable import MVPExample

class SuperHeroData {
    static let superHeroData: SuperHero = SuperHero(name: "a", photo: "b", realName: "c", height: "d", power: "f", abilities: "g", groups: "h")
    static let superHeroEmpty: [SuperHero] = []
    static let superHeroArray: [SuperHero] = [SuperHeroData.superHeroData]
}
