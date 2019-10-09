//
//  EstimatedGridViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/8/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit

class EstimatedGridViewController: UIViewController, UICollectionViewDelegate {

    enum Section {
        case main
    }

    struct Item: Hashable {
        let text: String
        let image: UIImage?
    }
    var data: [Item] = [
        Item(text: "", image: UIImage(named: "guppy")),
        Item(text: "The Guppy is one of the most well-known and popular aquarium fish for both beginners and seasoned aquarists alike.", image: nil),
        Item(text: "They add plenty of color to tanks, are peaceful, relatively cheap and very easy to maintain.", image: nil),
        Item(text: "Poecilia wingei(also known as an Endler Guppy) is also part of the Poeciliidae family and is closely related to the common Guppy (Poecilia reticulata). It is thePoecilia reticulatathat we’ll be discussing in this article.", image: nil),
        Item(text: "Guppies are peaceful fish that like to be kept in groups. They’re active swimmers and pretty much move around all the time. You’ll often see the males chasing the females trying to impress them by wiggling their fins.", image: nil)
    ]

    var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil
    var collection: UICollectionView! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Estimated Grid"
        setupCollectionView()
        setupDataSource()
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                             heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(10), trailing: .fixed(10), bottom: .fixed(10))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        let section = NSCollectionLayoutSection(group: group)

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
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collection) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in

            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ImageCell.reuseIdentifier,
                for: indexPath) as? ImageCell else { fatalError("Cannot create new cell") }

            cell.shadowedCell()
            cell.setText(text: item.text)
            cell.setImage(image: item.image)

            return cell
        }

        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: false)
    }


}
