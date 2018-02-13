//
//  SuperHeroTableViewProtocolSpy.swift
//  MVPExampleTests
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation
@testable import MVPExample

class SuperHeroTableViewProtocolSpy: SuperHeroesTableViewProtocol {

    var loadTableCalled = false
    var goToSuperHeroDetailCalled = false
    var superHeroSended = SuperHero(name: "", photo: "", realName: "", height: "", power: "", abilities: "", groups: "")

    func loadTable() {
        loadTableCalled = true
    }

    func goToSuperHeroDetail(superHero: SuperHero) {
        goToSuperHeroDetailCalled = true
        superHeroSended = superHero
    }
}
