//
//  ViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/8/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    /// Section Identifier Type
    enum Section {
        case menu
    }
    /// Item Identifier Type
    enum Menu: String, CaseIterable {
        case EstimatedGrid = "Estimated Grid"
        case NestedGroup = "Nested Grouping"
        case Sections = "Sections"
        case AppStoreLike = "AppStore"
    }
    
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Menu>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select one layout type below"
        
        setupCollectionView()
        setupDataSource()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: menuLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.register(UINib(nibName: TextCell.nibName, bundle: nil), forCellWithReuseIdentifier: TextCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    private func menuLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(10), trailing: nil, bottom: .fixed(10))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource <Section, Menu>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, item: Menu) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifier, for: indexPath) as? TextCell
                else {
                    fatalError("cannot create cell")
                }
            
            cell.setText(text: item.rawValue)
            
            return cell
        })
        
        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Menu>()
        dataSourceSnapshot.appendSections([Section.menu])
        dataSourceSnapshot.appendItems(Array(Menu.allCases))
        dataSource.apply(dataSourceSnapshot, animatingDifferences: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuItem = dataSource.itemIdentifier(for: indexPath)!
        collectionView.deselectItem(at: indexPath, animated: true)
        
        var viewController: UIViewController!
        switch menuItem {
            case .EstimatedGrid:
                viewController = EstimatedGridViewController()
            case .NestedGroup:
                viewController = ComplexGroupViewController()
            case .Sections:
                viewController = SectionsViewController()
            case.AppStoreLike:
                viewController = AppStoreLikeController()
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

