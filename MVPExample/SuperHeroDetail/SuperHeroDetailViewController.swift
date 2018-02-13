//
//  SuperHeroDetailViewController.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation
import UIKit

//Input protocol for View
protocol SuperHeroDetailViewProtocol: class {
    func getImage(imageURL: String?)
    func getName(name: String?)
    func getRealName(realName: String?)
    func getHeight(height: String?)
    func getPower(power: String?)
    func getAbilities(abilities: String?)
    func getGroups(groups: String?)
}

class SuperHeroDetailViewController: UIViewController {

    var presenter: SuperHeroDetailPresenterProtocol!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var realNameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var powerLabel: UILabel!
    @IBOutlet var abilitiesLabel: UILabel!
    @IBOutlet var groupsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }
}

//MARK:- SuperHeroDetailViewProtocol
extension SuperHeroDetailViewController: SuperHeroDetailViewProtocol {
    func getImage(imageURL: String?) {
        if let data = PhotoUtils.loadPhoto(imageURL: imageURL) {
            photoImageView.image = UIImage(data: data)
        }
    }

    func getName(name: String?) {
        nameLabel.text = name
    }

    func getRealName(realName: String?) {
        realNameLabel.text = realName
    }

    func getHeight(height: String?) {
        heightLabel.text = height
    }

    func getPower(power: String?) {
        powerLabel.text = power
    }

    func getAbilities(abilities: String?) {
        abilitiesLabel.text = abilities
    }

    func getGroups(groups: String?) {
        groupsLabel.text = groups
    }
}
