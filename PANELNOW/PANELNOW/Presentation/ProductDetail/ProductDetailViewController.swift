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
    
   // TODO: 데이터 바인딩
    private let productId = 1
    private let mainTableView = ProductDetailView()
    private var productDetail: ProductDetailDTO?

    override func loadView() {
        self.view = mainTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        register()
        setDelegate()
        fetchData()
    }
    
    private func setStyle() {
        navigationController?.setNavigationBarHidden(true, animated: false)
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
        mainTableView.delegate = self
    }
    
    private func fetchData() {
        Task { [weak self] in
            guard let self = self else { return}
            
            do {
                let ProductDetailData = try await ProductDetailService.shared.fetchProductDetail(productId: productId)
                self.updateUI(with: ProductDetailData)
            } catch {
                print("개별 상품 불러오기 실패: \(error)")
            }
        }
    }
    
    @MainActor
    private func updateUI(with data: ProductDetailDTO) {
        self.productDetail = data
        self.mainTableView.tableView.reloadData()
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
        guard let section = CellSection(rawValue: section) else { return 0 }
        
        switch section {
        case .itemImage, .itemNameAndPoint, .itemDetail:
            return 8
        case .information:
            return 0
        }
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
        return productDetail != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = CellSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .itemImage:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemImageCell.identifier, for: indexPath) as? ItemImageCell else { return UITableViewCell() }
            guard let productDetail else { return UITableViewCell() }
            cell.configure(with: productDetail)
            return cell
        case .itemNameAndPoint:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemNameAndPointCell.identifier, for: indexPath) as? ItemNameAndPointCell else { return UITableViewCell() }
            guard let productDetail else { return UITableViewCell() }
            cell.configure(with: productDetail)
            return cell
        case .itemDetail:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemDetailCell.identifier, for: indexPath) as? ItemDetailCell else { return UITableViewCell() }
            return cell
        case .information:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.identifier, for: indexPath) as? InformationCell else { return UITableViewCell() }
            guard let productDetail else { return UITableViewCell() }
            cell.configure(with: productDetail)
            return cell
        }
    }
}

extension ProductDetailViewController: ProductDetailViewDelegate {
    func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
