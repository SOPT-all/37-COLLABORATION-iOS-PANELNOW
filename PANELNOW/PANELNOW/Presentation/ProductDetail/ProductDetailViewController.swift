//
//  ProductDetailViewController.swift
//  PANELNOW
//
//  Created by 홍준범 on 11/19/25.
//

import UIKit

import SnapKit
import Then

enum CellSection: Int, CaseIterable {
    case itemImage
    case itemNameAndPoint
    case itemDetail
    case information
}

class ProductDetailViewController: UIViewController {

    private let mainTableView = ProductDetailView()
    
    override func loadView() {
        self.view = mainTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: nil)

        register()
        setDelegate()
    }
    
    private func register() {
        mainTableView.tableView.register(ItemImageCell.self, forCellReuseIdentifier: ItemImageCell.identifier)
        mainTableView.tableView.register(ItemNameAndPointCell.self, forCellReuseIdentifier: ItemNameAndPointCell.identifier)
        mainTableView.tableView.register(ItemDetailCell.self, forCellReuseIdentifier: ItemDetailCell.identifier)
        mainTableView.tableView.register(InformationCell.self, forCellReuseIdentifier: InformationCell.identifier)
    }

    private func setDelegate() {
        mainTableView.tableView.delegate = self
        mainTableView.tableView.dataSource = self
    }
}

extension ProductDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = CellSection(rawValue: indexPath.section) else { return CGFloat() }
        switch section {
        case .itemImage:
            return 223
        case .itemNameAndPoint:
            return 303
        case .itemDetail:
            return 224
        case .information:
            return 662
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension ProductDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        CellSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = CellSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .itemImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemImageCell.identifier, for: indexPath) as? ItemImageCell else { return UITableViewCell() }
            return cell
        case .itemNameAndPoint:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemNameAndPointCell.identifier, for: indexPath) as? ItemNameAndPointCell else { return UITableViewCell() }
            return cell
        case .itemDetail:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemDetailCell.identifier, for: indexPath) as? ItemDetailCell else { return UITableViewCell() }
            return cell
        case .information:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.identifier, for: indexPath) as? InformationCell else { return UITableViewCell() }
            return cell
        }
    }
}
