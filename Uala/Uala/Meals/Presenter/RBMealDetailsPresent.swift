//
//  RBMealDetailsPresent.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import UIKit


class RBMealDetailsPresenter: RBMealDetailsPresentContract {
    var _meal: Meal
    var _view: RBMealDetailsViewContract
    
    required init(meal: Meal, view: RBMealDetailsViewContract) {
        _meal = meal
        _view = view
    }
    
    func loadData() {
        _view.loadMeals()
    }
    
    func mealDescription() -> String {
        return _meal.strInstructions
    }
    
    func mealTitle() -> String {
        return _meal.strMeal
    }
    

}
