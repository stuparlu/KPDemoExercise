//
//  ADTableViewCell.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var timeAndPlaceLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var thumbnailImageView: UIImageView?
    @IBOutlet weak var favoriteImageView: UIImageView?
    @IBOutlet weak var promotedImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addBorder()
        titleLabel?.contentMode = .topLeft
        favoriteImageView?.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(switchImage))
        favoriteImageView?.addGestureRecognizer(tapGesture)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func switchImage() {
        if favoriteImageView?.image == UIImage(named: ImageNames.StarEmpty) {
            favoriteImageView?.image = UIImage(named: ImageNames.StarFull)
        } else {
            favoriteImageView?.image = UIImage(named: ImageNames.StarEmpty)
        }
    }
}
