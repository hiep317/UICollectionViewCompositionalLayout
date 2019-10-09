//
//  ComplexGroupViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/8/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit
class ComplexGroupViewController: UIViewController, UICollectionViewDelegate {

    enum Section {
        case main
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collection: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Complex Group"
        setupCollectionView()
        setupDataSource()
    }

    private func createLayout() -> UICollectionViewLayout {
        
        let verticalItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(0.3))
        let verticalItem = NSCollectionLayoutItem(layoutSize: verticalItemSize)

        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                                       heightDimension: .fractionalHeight(1))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize,
                                                             subitem: verticalItem, count: 1)
        verticalGroup.interItemSpacing = .fixed(8)
        
        
        let horizontalItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                                      heightDimension: .fractionalHeight(1))
        let horizontalItem = NSCollectionLayoutItem(layoutSize: horizontalItemSize)

        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(0.3))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize,
                                                             subitems: [horizontalItem])
        horizontalGroup.interItemSpacing = .fixed(8)

        
        
        let horizontalsGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.75),
                                                       heightDimension: .fractionalHeight(1))
        let horizontalsGroup = NSCollectionLayoutGroup.vertical(layoutSize: horizontalsGroupSize,
                                                             subitems: [horizontalGroup, horizontalGroup])
        horizontalsGroup.interItemSpacing = .flexible(0)
        
        

        let finalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .fractionalHeight(0.5))
        let finalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: finalGroupSize,
                                                            subitems: [horizontalsGroup, verticalGroup])

        let section = NSCollectionLayoutSection(group: finalGroup)
        section.interGroupSpacing = 8

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    private func setupCollectionView() {
        collection = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collection.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collection.backgroundColor = .systemBackground
        collection.register(UINib(nibName: ImageCell.nibName, bundle: nil), forCellWithReuseIdentifier: ImageCell.reuseIdentifier)
        collection.delegate = self
        view.addSubview(collection)
    }

    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collection) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in

            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ImageCell.reuseIdentifier,
                for: indexPath) as? ImageCell else { fatalError("Cannot create new cell") }

            cell.setText(text: "")
            if ((indexPath.row - 9) % 10 == 0) {
                cell.setImage(image: UIImage.init(named: "cat"))
            } else {
                cell.setImage(image: UIImage.init(named: "guppy"))
            }
            
            cell.container.backgroundColor = .systemTeal

            return cell
        }

        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(1..<100))
        dataSource.apply(snapshot, animatingDifferences: false)
    }

}
