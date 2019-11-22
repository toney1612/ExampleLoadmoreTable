//
//  HeroMarvelTableViewCell.swift
//  ExampleLoadmoreTable
//
//  Created by Toney on 22/11/2562 BE.
//  Copyright © 2562 Toney. All rights reserved.
//

import UIKit

class HeroMarvelTableViewCell: UITableViewCell {
<<<<<<< HEAD
    
    @IBOutlet weak var heroNameLabel: UILabel!
    
=======
>>>>>>> 102a808752a3a71a583c130209ff43910c968ebf

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

<<<<<<< HEAD
    }
    
    func configure(with model: HeroMarvelModel) {
        self.heroNameLabel.text = model.name
=======
        // Configure the view for the selected state
>>>>>>> 102a808752a3a71a583c130209ff43910c968ebf
    }
    
}
