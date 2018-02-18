//
//  SuperHeroCell.swift
//  MVPExample
//
//  Created by Fernando García Fernández on 13/2/18.
//  Copyright © 2018 Fernando García Fernández. All rights reserved.
//

import Foundation
import UIKit

protocol SuperHeroCellProtocol {
    func loadData(imageURL: String?, name: String?, realName: String?)
}

class SuperHeroCell: UITableViewCell {

    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var realNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }

    func setUpCell() {
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2;
        photoImageView.clipsToBounds = true;
    }
}

extension SuperHeroCell: SuperHeroCellProtocol {
    func loadData(imageURL: String?, name: String?, realName: String?) {
        nameLabel.text = name
        realNameLabel.text = realName
        if let data = PhotoUtils.loadPhoto(imageURL: imageURL) {
            photoImageView.image = UIImage(data: data)
        }
    }
}
