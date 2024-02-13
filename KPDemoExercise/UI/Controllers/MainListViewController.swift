//
//  ViewController.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import UIKit

class MainListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let model = MainListViewModel()
    
    // MARK: View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadNavigationBar()
        setupTableView()
    }
    
    // MARK: Setup Subviews

    func setupTableView() {
        tableView.register(UINib(nibName: ViewIdentifiers.ADTableViewCell, bundle: nil), forCellReuseIdentifier: ViewIdentifiers.ADTableViewCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedSectionHeaderHeight = 50.0
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 20.0
        tableView.sectionFooterHeight = UITableView.automaticDimension
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifiers.ADTableViewCell, for: indexPath) as! ADTableViewCell
        let cellData = model.tableViewCellData[10 * indexPath.section + indexPath.row]
        cell.titleLabel.text = cellData.name
        cell.timeAndPlaceLabel.text = "\(cellData.location_name), \(cellData.posted)"
        cell.priceLabel.text = "\(cellData.price) \(cellData.currency?.capitalized ?? "")"
        return cell as UITableViewCell
    }
}

// MARK: UITableViewDelegate Methods

extension MainListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        
        let titleLabel = UILabel()
        titleLabel.text = "\(section + 1) od \(model.totalPages)"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16.0),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped cell at row \(indexPath.section * indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
