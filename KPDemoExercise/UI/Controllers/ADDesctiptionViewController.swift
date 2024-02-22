//
//  ADDesctiptionViewController.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 14.2.24..
//

import Foundation
import UIKit

class ADDesctiptionViewController: UIViewController {
    let model : ADDesctiptionModel
    
    @IBOutlet weak var adTitleView: UIView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var placeLabel: UILabel?
    @IBOutlet weak var priceLabel: UILabel?
    @IBOutlet weak var favoriteImageView: UIImageView?
    @IBOutlet weak var promotedImageView: UIImageView?
    @IBOutlet weak var thumbnailImageView: UIImageView?
    @IBOutlet weak var categoryView: UIView?
    @IBOutlet weak var categoryLabel: UILabel?
    @IBOutlet weak var descriptionImageView: UIImageView?
    @IBOutlet weak var adDescriptionTextView: UITextView?
    @IBOutlet weak var categoryViewHeightConstraint: NSLayoutConstraint?
    @IBOutlet weak var adDescriptionHeightConstraint: NSLayoutConstraint?
    @IBOutlet weak var descriptionImageHeightConstraint: NSLayoutConstraint?
    
    
    init(adData: ADData?) {
        if let adData = adData {
            let adDescription = PersistenceManager.shared.fetchDescription(withAdID: String(adData.ad_id))
            self.model = ADDesctiptionModel(adData: adData, adDescription: adDescription)
        } else {
            self.model = ADDesctiptionModel(adData: nil, adDescription: nil)
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init( adData: nil)
    }
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        adTitleView?.addBorder()
        categoryView?.addBorder()
        adDescriptionTextView?.addBorder()
        descriptionImageView?.addBorder()
        
        if let adData = model.adData, let adDescription = model.adDescription {
            StyleManager.styleTitle(label: titleLabel, model: adData)
            StyleManager.styleTimeFor(label: placeLabel, model: adData)
            StyleManager.stylePriceFor(label: priceLabel, model: adData)
            StyleManager.styleImagesFor(favorites: favoriteImageView, promoted: promotedImageView, model: adData)
            categoryLabel?.text = adDescription.cateogry_name
            let description = adDescription.ad_description ?? ""
            if let data = description.data(using: .unicode), let attributedString = try? NSAttributedString(data: data,
                                                              options: [.documentType: NSAttributedString.DocumentType.html],
                                                              documentAttributes: nil) {
                adDescriptionTextView?.attributedText = attributedString
                let padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
                adDescriptionTextView?.textContainerInset = padding
            }
            ImageDownloader.downloadImageTo(imageView: thumbnailImageView, resource: adData.photo1_tmb_300x300)
            if let resourceLink = adDescription.photos {
                ImageDownloader.downloadImageTo(imageView: descriptionImageView, resource: resourceLink)
            }
        } else {
            categoryView?.isHidden = true
            adDescriptionTextView?.isHidden = true
            descriptionImageView?.isHidden = true
            priceLabel?.isHidden = true
            categoryViewHeightConstraint?.constant = 0.0
            adDescriptionHeightConstraint?.constant = 0.0
            descriptionImageHeightConstraint?.constant = 0.0
        }
    }
}
