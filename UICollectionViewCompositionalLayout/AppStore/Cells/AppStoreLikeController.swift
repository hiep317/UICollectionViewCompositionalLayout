//
//  AppStoreLikeController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/9/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
import UIKit
class AppStoreLikeController: UIViewController, UICollectionViewDelegate {
    
    static let footerKind = "FooterKind"
    static let headerKind = "HeaderKind"

    enum Section: Int {
        case featured = 0
        case listGames1 = 1
        case listGames2 = 2
        case gameOfTheMonth = 3
        case topCategory = 4
        case quickGuideLink = 5
    }

    var dataSource: UICollectionViewDiffableDataSource<Section, Game>! = nil
    var collection: UICollectionView! = nil
    var dynamicAnimator: UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AppStore"
        setupCollectionView()
        setupDataSource()
    }

    private func listSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.94),
                                               heightDimension: .fractionalHeight(0.325))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item, count: 3)

        // Header footer
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: AppStoreLikeController.headerKind,
                                                                 alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }

    private func featureSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(400),
                                              heightDimension: .estimated(361))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(8), top: .fixed(0), trailing:.fixed(8), bottom: .fixed(0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),
                                               heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitem: item, count: 1)
        
        // Header footer
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: AppStoreLikeController.headerKind,
                                                                 alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func gameOfTheMonthSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(256),
                                              heightDimension: .absolute(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(8), top: .fixed(0), trailing:.fixed(8), bottom: .fixed(0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                               heightDimension: .fractionalHeight(0.225))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item, count: 1)
        
        // Header footer
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: AppStoreLikeController.headerKind,
                                                                 alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func topCategorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(10), trailing: nil, bottom: .fixed(0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        // Header footer
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: AppStoreLikeController.headerKind,
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    private func quickGuideSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(10), trailing: nil, bottom: .fixed(0))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        // Header footer
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: AppStoreLikeController.headerKind,
                                                                 alignment: .top)
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(300.0))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize,
                                                                 elementKind: AppStoreLikeController.footerKind,
                                                                 alignment: .bottom)

        section.boundarySupplementaryItems = [header, footer]
        
        return section
    }
    

    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, env -> NSCollectionLayoutSection? in
            switch Section(rawValue: sectionNumber) {
            case .featured:
                return self.featureSection()
            case .listGames1:
                return self.listSection()
            case .listGames2:
                return self.listSection()
            case .gameOfTheMonth:
                return self.gameOfTheMonthSection()
            case .topCategory:
                return self.topCategorySection()
            case .quickGuideLink:
                return self.quickGuideSection()
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
        collection.register(UINib(nibName: FeaturedCell.nibName, bundle: nil), forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier)
        collection.register(UINib(nibName: IconCell.nibName, bundle: nil), forCellWithReuseIdentifier: IconCell.reuseIdentifier)
        collection.register(UINib(nibName: GOTMCell.nibName, bundle: nil), forCellWithReuseIdentifier: GOTMCell.reuseIdentifier)
        collection.register(UINib(nibName: TopCategoryCell.nibName, bundle: nil), forCellWithReuseIdentifier: TopCategoryCell.reuseIdentifier)
        collection.register(UINib(nibName: LinkCell.nibName, bundle: nil), forCellWithReuseIdentifier: LinkCell.reuseIdentifier)
        
        collection.register(UINib(nibName: HeaderView.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: AppStoreLikeController.headerKind, withReuseIdentifier: HeaderView.reuseIdentifier)
        collection.register(UINib(nibName: FooterView.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: AppStoreLikeController.footerKind, withReuseIdentifier: FooterView.reuseIdentifier)
        collection.delegate = self
        view.addSubview(collection)
    }

    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Game>(collectionView: collection) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Game) -> UICollectionViewCell? in

            if (indexPath.section == Section.featured.rawValue){
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: FeaturedCell.reuseIdentifier,
                    for: indexPath) as? FeaturedCell else { fatalError("Cannot create new cell") }
                cell.setGame(game: identifier)
                return cell
            } else if (indexPath.section == Section.listGames1.rawValue || indexPath.section == Section.listGames2.rawValue) {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: IconCell.reuseIdentifier,
                    for: indexPath) as? IconCell else { fatalError("Cannot create new cell") }
                cell.setGame(game: identifier)
                cell.separator.isHidden = (indexPath.row + 1) % 3 == 0
                return cell
            } else if (indexPath.section == Section.gameOfTheMonth.rawValue) {
               guard let cell = collectionView.dequeueReusableCell(
                   withReuseIdentifier: GOTMCell.reuseIdentifier,
                   for: indexPath) as? GOTMCell else { fatalError("Cannot create new cell") }
                cell.setModel(model: identifier)
               return cell
           } else if (indexPath.section == Section.topCategory.rawValue) {
                guard let cell = collectionView.dequeueReusableCell(
                       withReuseIdentifier: TopCategoryCell.reuseIdentifier,
                       for: indexPath) as? TopCategoryCell else { fatalError("Cannot create new cell") }
                cell.setCategory(game: identifier)
                   return cell
           } else {
                 guard let cell = collectionView.dequeueReusableCell(
                     withReuseIdentifier: LinkCell.reuseIdentifier,
                     for: indexPath) as? LinkCell else { fatalError("Cannot create new cell") }
                cell.setModel(model: identifier)
                 return cell
             }
        }
        
        dataSource.supplementaryViewProvider = {(
            collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in

            var supplementaryView: UICollectionReusableView! = nil
            
            // Get a supplementary view of the desired kind.
            switch kind {
            case AppStoreLikeController.headerKind:
                
                if let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: HeaderView.reuseIdentifier,
                    for: indexPath) as? HeaderView {

                    switch indexPath.section {
                    case Section.featured.rawValue:
                        headerView.titleLbl.text = "Games"
                        headerView.seeAllButton.isHidden = true
                    case Section.listGames1.rawValue:
                        headerView.titleLbl.text = "What We're Playing"
                    case Section.listGames2.rawValue:
                        headerView.titleLbl.text = "New Games We Love"
                    case Section.gameOfTheMonth.rawValue:
                        headerView.titleLbl.text = "Games Of The Month"
                    case Section.topCategory.rawValue:
                        headerView.titleLbl.text = "Top Categories"
                    case Section.quickGuideLink.rawValue:
                        headerView.titleLbl.text = "Quick Links"
                    default:
                        ()
                    }
                    supplementaryView = headerView
                } else {
                    fatalError("Cannot create new supplementary")
                }
                break;
            case AppStoreLikeController.footerKind:
                if (indexPath.section == Section.quickGuideLink.rawValue) {
                    if let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterView.reuseIdentifier, for: indexPath) as? FooterView {
                        supplementaryView = footerView
                    }  else {
                        fatalError("Cannot create new supplementary")
                    }
                }
                break;
            default:
                ()
            }
            
            return supplementaryView
        }
        

        //  dummy data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Game>()
        snapshot.appendSections([.featured])
        snapshot.appendItems(Game.featuredGames)
        
        snapshot.appendSections([.listGames1])
        snapshot.appendItems(Game.weArePlayingGames)
        
        snapshot.appendSections([.listGames2])
        snapshot.appendItems(Game.weArePlayingGames.reversed())
        
        snapshot.appendSections([.gameOfTheMonth])
        snapshot.appendItems(Game.gamesOfTheMonth)
        
        snapshot.appendSections([.topCategory])
        snapshot.appendItems(Game.listCategories)
        
        snapshot.appendSections([.quickGuideLink])
        snapshot.appendItems(Game.quickLinks)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
