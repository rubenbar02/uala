//
//  RBMealDetailsContract.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import Foundation

protocol RBMealDetailsViewContract {
    func loadMeals()
    func showError(description: String)
}

protocol RBMealDetailsPresentContract {
    init(meal: Meal, view: RBMealDetailsViewContract)
    func loadData()
    func mealDescription() -> String
    func mealTitle() -> String
}
