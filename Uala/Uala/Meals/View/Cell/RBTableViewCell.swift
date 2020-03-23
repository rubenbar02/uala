//
//  RBTableViewCell.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import UIKit
import Kingfisher


class RBTableViewCell: UITableViewCell {

    @IBOutlet weak var _title: UILabel!
    @IBOutlet weak var _category: UILabel!
    @IBOutlet var _mealImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        _mealImageView.kf.indicatorType = .activity

    }
    
    func setData(title: String, category: String, path: String) {
        _title.text = title
        _category.text = category
        
        let iURL = URL(string: path)
        _mealImageView.kf.setImage(with: iURL, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
