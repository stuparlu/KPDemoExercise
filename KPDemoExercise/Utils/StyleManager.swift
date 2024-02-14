//
//  StyleManager.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 14.2.24..
//

import Foundation
import UIKit

struct StyleManager {
    static func styleTitle(label: UILabel, model: ADData) {
        label.text = model.name
        label.font = UIFont(name: Fonts.PTSansRegular, size: 16)
        label.textColor = UIColor(named: ColorNames.FontTitleColor)
    }
    
    static func styleTimeFor(label: UILabel, model: ADData) {
        let ago = DateUtils.dateToAgo(dateText: model.posted)
        label.text = "\(model.location_name), \(ago)"
    }
    
    static func stylePriceFor(label: UILabel , model: ADData) {
        if let currency = model.currency {
            let currencyText = currency == KeyStrings.rsd ? DisplayStrings.din : DisplayStrings.eurSymbol
            label.text = "\(model.price) \(currencyText)"
        } else {
            label.text = DisplayStrings.Contact
        }
    }
    
    static func styleImagesFor(favorites: UIImageView, promoted: UIImageView, model: ADData) {
        favorites.image = UIImage(named: model.is_following_ad ? ImageNames.StarFull : ImageNames.StarEmpty)
        favorites.isUserInteractionEnabled = true
        promoted.image = model.favorite_count > 15 ? UIImage(named: model.favorite_count > 25 ? ImageNames.PromoSearch : ImageNames.PromoTop) : nil
    }
}
