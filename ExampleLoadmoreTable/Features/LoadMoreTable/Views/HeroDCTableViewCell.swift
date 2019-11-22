//
//  HeroDCTableViewCell.swift
//  ExampleLoadmoreTable
//
//  Created by Toney on 22/11/2562 BE.
//  Copyright © 2562 Toney. All rights reserved.
//

import UIKit

class HeroDCTableViewCell: UITableViewCell {

    @IBOutlet weak var heroNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: HeroDcModel) {
        self.heroNameLabel.text = model.name
    }
}
