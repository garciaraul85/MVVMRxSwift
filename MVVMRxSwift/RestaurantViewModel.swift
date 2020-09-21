//
//  RestaurantViewModel.swift
//  MVVMRxSwift
//
//  Created by Saulo Garcia on 9/21/20.
//

import Foundation

struct RestaurantViewModel {
    let restaurant: Restaurant
    
    // Computed property
    var displayText: String {
        return "\(self.restaurant.name) - \(self.restaurant.cuisine.rawValue.capitalized)"
    }
    
    init (restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
