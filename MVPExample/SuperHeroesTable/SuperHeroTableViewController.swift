//
//  SuperHeroTableViewController.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation
import UIKit

//Input protocol for View
protocol SuperHeroesTableViewProtocol: class {
    func loadTable()
    func goToSuperHeroDetail(superHero: SuperHero)
}

class SuperHeroesTableViewController: UITableViewController {

    var presenter: SuperHeroesTablePresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewIsReady()
    }

    func setUpTable() {
        tableView.register(UINib(nibName: "SuperHeroCell", bundle: nil), forCellReuseIdentifier: "SuperHeroCell")
    }
}

//MARK:- UITableViewDataSource
extension SuperHeroesTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewNeedsNumberOfSuperHeroes()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroCell", for: indexPath) as! SuperHeroCell
        let (image, name, realName) = presenter.viewNeedsForASuperHero(byIndex: indexPath.row)
        cell.loadData(imageURL: image, name: name, realName: realName)
        return cell
    }
}

//MARK:- UITableViewDelegate
extension SuperHeroesTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.viewSelectASuperHero(byIndex: indexPath.row)
    }
}

//MARK:- SuperHeroesTableViewProtocol
extension SuperHeroesTableViewController: SuperHeroesTableViewProtocol {
    func loadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func goToSuperHeroDetail(superHero: SuperHero) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SuperHeroDetail") as? SuperHeroDetailViewController{
            let presenter = SuperHeroDetailPresenter(view: viewController, superHero: superHero)
            viewController.presenter = presenter
            navigationController?.pushViewController(viewController, animated: true)
        }

    }
}
