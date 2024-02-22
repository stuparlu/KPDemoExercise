//
//  ViewController.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import UIKit

class MainListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    let model = MainListViewModel()
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadNavigationBar()
        setupTableView()
    }
    
    // MARK: Setup Subviews
    
    func setupTableView() {
        tableView?.register(UINib(nibName: ViewIdentifiers.ADTableViewCell, bundle: nil), forCellReuseIdentifier: ViewIdentifiers.ADTableViewCell)
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.estimatedSectionHeaderHeight = 50.0
        tableView?.sectionHeaderHeight = UITableView.automaticDimension
        tableView?.estimatedSectionFooterHeight = 20.0
        tableView?.sectionFooterHeight = UITableView.automaticDimension
    }
    
    func loadThumbnalImageFor(cell: ADTableViewCell, cellData: ADData) {
        ImageDownloader.downloadImageTo(imageView: cell.thumbnailImageView, resource: cellData.photo1_tmb_300x300)
    }
    
    func styleViewFor(cell: ADTableViewCell, indexPath: IndexPath) {
        if indexPath.row == 9 {
            cell.addBorder()
        } else {
            cell.addTopBorder()
        }
    }
}

// MARK: UITableViewDataSource Methods

extension MainListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.totalPages
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifiers.ADTableViewCell, for: indexPath) as? ADTableViewCell else {
            return UITableViewCell()
        }
        let cellIndex = 10 * indexPath.section + indexPath.row
        let cellData = model.tableViewCellData[cellIndex]
        StyleManager.styleTitle(label: cell.titleLabel, model: cellData)
        StyleManager.styleTimeFor(label: cell.priceLabel, model: cellData)
        StyleManager.stylePriceFor(label: cell.priceLabel, model: cellData)
        loadThumbnalImageFor(cell: cell, cellData: cellData)
        StyleManager.styleImagesFor(favorites: cell.favoriteImageView, promoted: cell.promotedImageView, model: cellData)
        styleViewFor(cell: cell, indexPath: indexPath)
        return cell as UITableViewCell
    }
}

// MARK: UITableViewDelegate Methods

extension MainListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.layer.borderWidth = 1.0
        headerView.layer.borderColor = UIColor(named: ColorNames.BorderGrey)?.cgColor
        if section > 0 {
            headerView.backgroundColor = UIColor(named: ColorNames.NavBarWhite)
            let titleLabel = UILabel()
            titleLabel.text = "\(section + 1)\(DisplayStrings.of)\(model.totalPages)"
            titleLabel.textAlignment = .center
            titleLabel.textColor = UIColor(named: ColorNames.FontSubtitleColor)
            titleLabel.font = UIFont(name: Fonts.PTSansRegular, size: 12)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
            ])
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section != 0  ? 38.0 : 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        if section == model.totalPages - 1 {
            let titleLabel = UILabel()
            titleLabel.text = DisplayStrings.KPCopyrightNotice
            titleLabel.textAlignment = .center
            titleLabel.textColor = UIColor(named: ColorNames.FontSubtitleColor)
            titleLabel.font = UIFont(name: Fonts.PTSansRegular, size: 16)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            footerView.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
                titleLabel.centerYAnchor.constraint(equalTo: footerView.centerYAnchor)
            ])
        }
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        section == model.totalPages - 1 ? 38 : 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let newVC = ADDesctiptionPageController(adArray: model.tableViewCellData, adIndex:  10 * indexPath.section + indexPath.row)
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
}
