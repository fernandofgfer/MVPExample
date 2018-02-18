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
    func configureItemView(_ view: SuperHeroCellProtocol, at index: Int)
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
        UseCase().getListOfSuperHeroes(url: "https://api.myjson.com/bins/bvyob") {[weak self](superHeoesArray) in
            self?.superHeroesReceived(superHeroesArray: superHeoesArray)
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

    func viewSelectASuperHero(byIndex: Int) {
        view?.goToSuperHeroDetail(superHero: superHeroesArray[byIndex])
    }

    func configureItemView(_ view: SuperHeroCellProtocol, at index: Int) {
        let superHero = superHeroesArray[index]
        view.loadData(imageURL: superHero.getPhoto(), name: superHero.getName(), realName: superHero.getRealName())
    }
}
