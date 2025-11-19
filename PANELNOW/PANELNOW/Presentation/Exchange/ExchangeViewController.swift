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
            $0.edges.equalToSuperview()
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

#Preview {
    ExchangeViewController()
}
