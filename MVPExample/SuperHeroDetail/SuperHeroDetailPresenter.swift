//
//  SuperHeroDetailPresenter.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation

protocol SuperHeroDetailPresenterProtocol: class{
    func viewIsReady()
}

class SuperHeroDetailPresenter {
    weak var view: SuperHeroDetailViewProtocol?
    let superHero: SuperHero
    init(view: SuperHeroDetailViewProtocol?, superHero: SuperHero) {
        self.view = view
        self.superHero = superHero
    }
}

extension SuperHeroDetailPresenter: SuperHeroDetailPresenterProtocol {
    func viewIsReady() {
        view?.getImage(imageURL: superHero.getPhoto())
        view?.getName(name: superHero.getName())
        view?.getRealName(realName: superHero.getRealName())
        view?.getHeight(height: superHero.getHeight())
        view?.getPower(power: superHero.getPower())
        view?.getAbilities(abilities: superHero.getAbilities())
        view?.getGroups(groups: superHero.getGroups())
    }
}

