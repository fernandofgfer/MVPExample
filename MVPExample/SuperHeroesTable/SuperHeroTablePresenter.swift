//
//  SuperHeroTablePresenter.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation

protocol SuperHeroesTablePresenterProtocol {
    func viewIsReady()
    func viewNeedsForASuperHero(byIndex: Int) -> (String?, String?, String?)
    func viewNeedsNumberOfSuperHeroes() -> Int
    func viewSelectASuperHero(byIndex: Int)
}

class SuperHeroesTablePresenter{

    var superHeroesArray: [SuperHero]
    weak var view: SuperHeroesTableViewProtocol?

    init(view: SuperHeroesTableViewProtocol?){
        self.view = view
        superHeroesArray = []
    }

    func loadSuperHeroes(){
        UseCase().getListOfSuperHeroes(url: "https://api.myjson.com/bins/bvyob") {(superHeoesArray) in
            self.superHeroesReceived(superHeroesArray: superHeoesArray)
        }
    }

    func superHeroesReceived(superHeroesArray: [SuperHero]?) {
        if let _ = superHeroesArray {
            self.superHeroesArray = superHeroesArray!
        }
        view?.loadTable()
    }
}

extension SuperHeroesTablePresenter: SuperHeroesTablePresenterProtocol {
    func viewNeedsNumberOfSuperHeroes() -> Int {
        return superHeroesArray.count
    }

    func viewIsReady() {
        loadSuperHeroes()
    }

    func viewNeedsForASuperHero(byIndex: Int) -> (String?, String?, String?) {
        return superHeroesArray.indices.contains(byIndex) ? (superHeroesArray[byIndex].getPhoto(), superHeroesArray[byIndex].getName(), superHeroesArray[byIndex].getRealName()) : (nil, nil, nil)
    }

    func viewSelectASuperHero(byIndex: Int) {
        view?.goToSuperHeroDetail(superHero: superHeroesArray[byIndex])
    }
}
