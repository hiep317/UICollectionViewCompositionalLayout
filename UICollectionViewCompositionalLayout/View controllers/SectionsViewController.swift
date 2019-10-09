//
//  SectionsViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/8/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit
class SectionsViewController: UIViewController, UICollectionViewDelegate {

    enum Section: Int {
        case first = 0
        case second = 1
        case third = 2
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Int>! = nil
    var collection: UICollectionView! = nil
    var dynamicAnimator: UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Multiple Sections"
        setupCollectionView()
        setupDataSource()
    }

    private func listSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])

        return NSCollectionLayoutSection(group: group)
    }

    private func gridSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitem: item, count: 3)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }

    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, env -> NSCollectionLayoutSection? in
            switch Section(rawValue: sectionNumber) {
            case .first:
                return self.gridSection()
            case .second:
                return self.listSection()
            case .third:
                return self.gridSection()
            default:
                return nil
            }
        }
    }

    private func setupCollectionView() {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)

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
            if (indexPath.section == 1) {
                cell.setImage(image: UIImage.init(named: "guppy"))
            } else {
                cell.setImage(image: UIImage.init(named: "cat"))
            }
            
            cell.container.backgroundColor = .yellow
            cell.container.layer.cornerRadius = 10
            return cell
        }

        //  dummy data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.first])
        snapshot.appendItems(Array(1..<5))
        
        snapshot.appendSections([.second])
        snapshot.appendItems(Array(6..<9))
        
        snapshot.appendSections([.third])
        snapshot.appendItems(Array(10..<100))
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
