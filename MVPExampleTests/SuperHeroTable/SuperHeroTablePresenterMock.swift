//
//  SuperHeroTablePresenterMock.swift
//  MVPExampleTests
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation
@testable import MVPExample

class SuperHeroTablePresenterMock: SuperHeroesTablePresenter {
    var loadSuperHeroCalled = false

    override func loadSuperHeroes() {
        loadSuperHeroCalled = true
    } //Unit test never have call to networking
}
