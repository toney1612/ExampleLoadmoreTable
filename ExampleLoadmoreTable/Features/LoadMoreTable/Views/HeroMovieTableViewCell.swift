//
//  HeroMovieTableViewCell.swift
//  ExampleLoadmoreTable
//
//  Created by Toney on 23/11/2562 BE.
//  Copyright © 2562 Toney. All rights reserved.
//

import UIKit

class HeroMovieTableViewCell: UITableViewCell {
    
    var source: [HeroMovieModel] = []
    
    struct Constants {
        static let collection_reuse_iden = "collection_reuse_iden"
    }
    
    @IBOutlet weak var cellCollectionView: UICollectionView!
    @IBOutlet weak var frameHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupCollection() {
        self.cellCollectionView.dataSource = self
        self.cellCollectionView.delegate = self
        self.cellCollectionView.isScrollEnabled = false
        self.cellCollectionView.register(UINib(nibName: "HeroMovieCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.collection_reuse_iden)
    }
    
    func configure(with movie: [HeroMovieModel]) {
        self.source = movie
        self.cellCollectionView.reloadData()
        self.reConstraintHeight()
    }
    
    private func reConstraintHeight() {
        let rows = Int((self.source.count / 2)) + (self.source.count % 2)
        let space = 10 * (rows - 1)
        self.frameHeight.constant = CGFloat(150 * rows) + CGFloat(space)
    }
    
}
extension HeroMovieTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.cellCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.collection_reuse_iden, for: indexPath)
        if let cell = cell as? HeroMovieCardCollectionViewCell {
            cell.configure(model: self.source[indexPath.row])
        }
        return cell
    }
    
}
extension HeroMovieTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width / 2) - collectionView.contentInset.left - collectionView.contentInset.right - 21
        return CGSize(width: width, height: 150)
    }
}
