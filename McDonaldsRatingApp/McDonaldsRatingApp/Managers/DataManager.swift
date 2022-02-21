//
//  DataManager.swift
//  McDonaldsRatingApp
//
//  Created by Valya on 21.02.22.
//

import UIKit

class DataManager {
    
    private init() {
        meals = [Meal(name: Constants.nameBigMac, price: Constants.priceBigMac, image: Constants.imageBigMac, description: Constants.descriptionBigMac, weight: Constants.weightBigMac, calories: Constants.caloriesBigMac),
                 Meal(name: Constants.nameChikenBurger, price: Constants.priceChikenBurger, image: Constants.imageChikenBurger, description: Constants.descriptionChikenBurger, weight: Constants.weightChikenBurger, calories: Constants.caloriesChikenBurger),
                 Meal(name: Constants.nameFileOFish, price: Constants.priceFileOFish, image: Constants.imageFileOFish, description: Constants.descriptionFileOFish, weight: Constants.weightFileOFish, calories: Constants.caloriesFileOFish)]
    }
    
    var meals: [Meal]
    
    static let shared = DataManager()
    
}
