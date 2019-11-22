//
//  HeroMarvelTableViewCell.swift
//  ExampleLoadmoreTable
//
//  Created by Toney on 22/11/2562 BE.
//  Copyright © 2562 Toney. All rights reserved.
//

import UIKit

class HeroMarvelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with model: HeroMarvelModel) {
        self.heroNameLabel.text = model.name
    }
    
}
