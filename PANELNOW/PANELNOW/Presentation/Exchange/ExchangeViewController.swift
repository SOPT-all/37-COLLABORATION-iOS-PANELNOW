//
//  ExchangeViewController.swift
//  PANELNOW
//
//  Created by 박정환 on 11/19/25.
//

import UIKit

import SnapKit
import Then

enum ExchangeSection: Int, CaseIterable {
    case navigation
    case point
    case sort
    case items
}

enum SortOption {
    case popular
    case price

    var title: String {
        switch self {
        case .popular:
            return "인기순"
        case .price:
            return "가격순"
        }
    }
}

final class ExchangeViewController: UIViewController {

    private let lineSpacing: CGFloat = 24
    private let itemSpacing: CGFloat = 23
    private let cellHeight: CGFloat = 214
    private let collectViewInset: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = itemSpacing
        layout.sectionInset = collectViewInset

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        collectionView.alwaysBounceVertical = false
        collectionView.bounces = false
        
        return collectionView
    }()

    // 포인트, 상품 데이터
    private var currentPoint: Int = 4500
    private var exchangedPoint: Int = 4000
    private var items: [ExchangeItemModel] = []

    private var currentSort: SortOption = .popular

    private var sortOverlayView: UIView?
    private var sortOptionView: SortOptionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)

        setUI()
        setLayout()
        register()
        setDelegate()
        loadMockData()
    }

    private func setUI() {
        view.backgroundColor = .gray04
    }

    private func setLayout() {
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func register() {
        collectionView.register(NavigationCell.self,
                                forCellWithReuseIdentifier: NavigationCell.identifier)
        collectionView.register(PointCell.self,
                                forCellWithReuseIdentifier: PointCell.identifier)
        collectionView.register(SortCell.self,
                                forCellWithReuseIdentifier: SortCell.identifier)
        collectionView.register(ExchangeCollectionViewCell.self,
                                forCellWithReuseIdentifier: ExchangeCollectionViewCell.identifier)
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func loadMockData() {
        items = ExchangeItemModel.mockData
        collectionView.reloadData()
    }

    @objc private func didTapBell() {
        // 알림 화면으로 이동
    }

    @objc private func didTapProfile() {
        // 프로필 화면으로 이동
    }
}

extension ExchangeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ExchangeSection.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {

        guard let sectionType = ExchangeSection(rawValue: section) else { return 0 }

        switch sectionType {
        case .navigation,
             .point,
             .sort:
            return 1
        case .items:
            return items.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let sectionType = ExchangeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch sectionType {
        case .navigation:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NavigationCell.identifier,
                for: indexPath
            ) as? NavigationCell else {
                return UICollectionViewCell()
            }
            cell.configure(didTapBell: { [weak self] in
                self?.didTapBell()
            }, didTapProfile: { [weak self] in
                self?.didTapProfile()
            })
            return cell

        case .point:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PointCell.identifier,
                for: indexPath
            ) as? PointCell else {
                return UICollectionViewCell()
            }
            cell.configure(point: currentPoint, exchangedPoint: exchangedPoint)
            return cell

        case .sort:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SortCell.identifier,
                for: indexPath
            ) as? SortCell else {
                return UICollectionViewCell()
            }

            cell.delegate = self
            cell.configure(option: currentSort)

            return cell

        case .items:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ExchangeCollectionViewCell.identifier,
                for: indexPath
            ) as? ExchangeCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configure(with: items[indexPath.item])
            return cell
        }
    }
}

extension ExchangeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        guard let sectionType = ExchangeSection(rawValue: indexPath.section) else {
            return .zero
        }

        let fullWidth = collectionView.bounds.width
        let horizontalInset: CGFloat = collectViewInset.left + collectViewInset.right
        let itemWidth: CGFloat = (fullWidth - horizontalInset - itemSpacing) / 2

        switch sectionType {
        case .navigation:
            return CGSize(width: fullWidth, height: 60)

        case .point:
            return CGSize(width: fullWidth, height: 160)

        case .sort:
            return CGSize(width: fullWidth, height: 56)

        case .items:
            return CGSize(width: itemWidth, height: cellHeight)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        guard let sectionType = ExchangeSection(rawValue: section) else {
            return .zero
        }

        switch sectionType {
        case .navigation:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        case .point:
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        case .sort:
            return UIEdgeInsets(top: 16, left: 16, bottom: 24, right: 16)

        case .items:
            return collectViewInset
        }
    }
}

extension ExchangeViewController: SortCellDelegate {

    func sortCellDidTapSort(_ cell: SortCell) {
        if sortOverlayView == nil {
            showSortOptions(from: cell)
        } else {
            hideSortOptions()
        }
    }

    private func showSortOptions(from cell: SortCell) {
        // 1) overlay
        let overlay = UIView()
        overlay.backgroundColor = .clear
        view.addSubview(overlay)
        overlay.snp.makeConstraints { $0.edges.equalToSuperview() }

        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSortOverlay))
        overlay.addGestureRecognizer(tap)

        // 2) option view
        let optionView = SortOptionView()
        optionView.didSelect = { [weak self] option in
            self?.applySort(option)
            self?.hideSortOptions()
        }

        overlay.addSubview(optionView)

        // 3) layout under the sort button
        let buttonFrameInView = cell.sortButton.convert(cell.sortButton.bounds, to: view)

        optionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(buttonFrameInView.maxY + 8)
            
            $0.leading.equalToSuperview().offset(buttonFrameInView.minX)
            
            $0.width.equalTo(buttonFrameInView.width)
            
            $0.height.equalTo(58)
        }

        sortOverlayView = overlay
        sortOptionView = optionView
    }

    @objc private func didTapSortOverlay() {
        hideSortOptions()
    }

    private func hideSortOptions() {
        sortOptionView?.removeFromSuperview()
        sortOverlayView?.removeFromSuperview()
        sortOptionView = nil
        sortOverlayView = nil
    }

    private func applySort(_ option: SortOption) {
        currentSort = option
        // TODO: 정렬 로직 추가
        let sortSection = ExchangeSection.sort.rawValue
        let itemsSection = ExchangeSection.items.rawValue
        collectionView.reloadSections(IndexSet([sortSection, itemsSection]))
    }
}

#Preview {
    ExchangeViewController()
}
