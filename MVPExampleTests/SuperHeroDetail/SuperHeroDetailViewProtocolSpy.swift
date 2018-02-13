//
//  SuperHeroDetailViewProtocolSpy.swift
//  MVPExampleTests
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation
@testable import MVPExample

class SuperHeroDetailViewProtocolSpy: SuperHeroDetailViewProtocol {

    var getImageString: String?
    var getNameString: String?
    var getRealNameString: String?
    var getHeightString: String?
    var getPowerString: String?
    var getAbilitiesString: String?
    var getGroupsString: String?

    func getImage(imageURL: String?) {
        getImageString = imageURL
    }

    func getName(name: String?) {
        getNameString = name
    }

    func getRealName(realName: String?) {
        getRealNameString = realName
    }

    func getHeight(height: String?) {
        getHeightString = height
    }

    func getPower(power: String?) {
        getPowerString = power
    }

    func getAbilities(abilities: String?) {
        getAbilitiesString = abilities
    }

    func getGroups(groups: String?) {
        getGroupsString = groups
    }


}
