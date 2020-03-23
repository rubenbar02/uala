//
//  Meal.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import Foundation

struct Meal: Decodable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strMealThumb: String
    let strDrinkAlternate: String?
    let strInstructions: String
}
