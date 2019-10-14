//
//  Game.swift
//  UICollectionViewCompositionalLayout
//
//  Created by Hiep Nguyen on 10/9/19.
//  Copyright © 2019 Hiep Nguyen. All rights reserved.
//

import Foundation
struct Game: Hashable {
    let id: String
    let name: String
    let category: String
    let description: String
    let status: String
    let iconImageName: String
    let posterImageName: String
    let hasInAppPurchases: Bool
    let price: Int
    
    
    static var featuredGames: [Game] {
        var array: [Game] = []
        array.append(
            Game(id: UUID().uuidString,
                 name: "Looney Tunes",
                 category: "Action",
                 description: "Get a limited-time power pack",
                 status: "LIMITED TIME",
                 iconImageName: "",
                 posterImageName: "Looney-poster",
                 hasInAppPurchases: true,
                 price: 5)
        )
        
        array.append(
            Game(id: UUID().uuidString,
                 name: "Mighty Quest For Epic Loot",
                 category: "Action",
                 description: "Everything is permitted",
                 status: "NEW UPDATE",
                 iconImageName: "",
                 posterImageName: "mighty quest poster",
                 hasInAppPurchases: true,
                 price: 5)
        )
        
        array.append(
            Game(id: UUID().uuidString,
                 name: "Torque Drift",
                 category: "Action",
                 description: "Massive multiplayer drifting",
                 status: "NEW UPDATE",
                 iconImageName: "",
                 posterImageName: "Torque Drift Poster",
                 hasInAppPurchases: true,
                 price: 5)
        )
        
        array.append(
            Game(id: UUID().uuidString,
                 name: "Zooba: Fun Battle Royale Games",
                 category: "Action",
                 description: "The zoo animals went wild",
                 status: "NEW GAME",
                 iconImageName: "",
                 posterImageName: "Zooba Poster",
                 hasInAppPurchases: true,
                 price: 5)
        )
        
        array.append(
            Game(id: UUID().uuidString,
                 name: "Takoway",
                 category: "Action",
                 description: "Another dimension of cureness",
                 status: "NEW GAME",
                 iconImageName: "",
                 posterImageName: "Takoway Poster",
                 hasInAppPurchases: true,
                 price: 5)
        )
        
        
        return array
    }
    
    static var weArePlayingGames: [Game] {
        var array: [Game] = []
        array.append(
            Game(id: UUID().uuidString,
                 name: "King of Kings - SEA",
                 category: "Action",
                 description: "Legendary Fantasy MMORPG",
                 status: "LIMITED TIME",
                 iconImageName: "Icon-1",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Mobile Legends",
                 category: "Action",
                 description: "New adventure, new legend!",
                 status: "LIMITED TIME",
                 iconImageName: "Mobile Legends",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Friends Saga",
                 category: "Action",
                 description: "Match 3 game",
                 status: "LIMITED TIME",
                 iconImageName: "Friends Saga",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 23)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Zooba",
                 category: "Action",
                 description: "Online battle royal game",
                 status: "NEW GAME",
                 iconImageName: "Zooba",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Merge Tower Bots",
                 category: "Strategy",
                 description: "TD Idle defense",
                 status: "NEW GAME",
                 iconImageName: "Merge Tower Bots",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "SimpleRockets 2",
                 category: "Strategy",
                 description: "Build and fly rockets",
                 status: "NEW GAME",
                 iconImageName: "SimpleRockets 2",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Mobile Legends",
                 category: "Action",
                 description: "New adventure, new legend!",
                 status: "LIMITED TIME",
                 iconImageName: "Mobile Legends",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Friends Saga",
                 category: "Action",
                 description: "Match 3 game",
                 status: "LIMITED TIME",
                 iconImageName: "Friends Saga",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 23)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Zooba",
                 category: "Action",
                 description: "Online battle royal game",
                 status: "NEW GAME",
                 iconImageName: "Zooba",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Merge Tower Bots",
                 category: "Strategy",
                 description: "TD Idle defense",
                 status: "NEW GAME",
                 iconImageName: "Merge Tower Bots",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "SimpleRockets 2",
                 category: "Strategy",
                 description: "Build and fly rockets",
                 status: "NEW GAME",
                 iconImageName: "SimpleRockets 2",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        
        
        return array
    }
    
    static var listCategories: [Game] {
        var array: [Game] = []
        array.append(
            Game(id: UUID().uuidString,
                 name: "",
                 category: "AR Games",
                 description: "",
                 status: "",
                 iconImageName: "AR Games",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "",
                 category: "Action",
                 description: "",
                 status: "",
                 iconImageName: "Action",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "",
                 category: "Adventure",
                 description: "",
                 status: "",
                 iconImageName: "Adventure",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "",
                 category: "Casual",
                 description: "",
                 status: "",
                 iconImageName: "Casual",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "",
                 category: "Kids",
                 description: "",
                 status: "",
                 iconImageName: "Kids",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "",
                 category: "Puzzle",
                 description: "",
                 status: "",
                 iconImageName: "Puzzle",
                 posterImageName: "",
                 hasInAppPurchases: false,
                 price: 0)
        )
        
        return array
    }
    
    static var gamesOfTheMonth: [Game] {
        var array: [Game] = []
        array.append(
            Game(id: UUID().uuidString,
                 name: "Second Galaxy",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "Poster-2",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Football Drama",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "Football Drama",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Ninja Prime: Tap Quest",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "Ninja Prime-Tap Quest",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "Powerpuff Girls",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "Powerpuff Girls",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "State of Survival",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "State of Survival",
                 hasInAppPurchases: true,
                 price: 0)
        )
        
        return array
    }
    
    static var quickLinks: [Game] {
        var array: [Game] = []
        array.append(
            Game(id: UUID().uuidString,
                 name: "Parent's Guide to the App Store",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        
        array.append(
            Game(id: UUID().uuidString,
                 name: "About In-App Purchases",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "About Apps & Games for Your Kids",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        array.append(
            Game(id: UUID().uuidString,
                 name: "About Persionalisation",
                 category: "",
                 description: "",
                 status: "",
                 iconImageName: "",
                 posterImageName: "",
                 hasInAppPurchases: true,
                 price: 0)
        )
        
        return array
    }
}
