//
//  HeroMovieCardCollectionViewCell.swift
//  ExampleLoadmoreTable
//
//  Created by Toney on 23/11/2562 BE.
//  Copyright © 2562 Toney. All rights reserved.
//

import UIKit

class HeroMovieCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupCell()
    }
    
    private func setupCell() {
        self.containerView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 8
        self.heroImageView.contentMode = .scaleAspectFill
    }
    
    func configure(model: HeroMovieModel) {
        if let image = UIImage(named: model.image) {
            self.heroImageView.image = image
        }
    }

}
