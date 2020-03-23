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
    
    func mealIngridient() -> String {
        return "\(_meal.strIngredient1 ?? "") \(_meal.strMeasure1 ?? ""), \(_meal.strIngredient2 ?? "") \(_meal.strMeasure2 ?? ""),\(_meal.strIngredient3 ?? "") \(_meal.strMeasure3 ?? ""),\(_meal.strIngredient4 ?? "") \(_meal.strMeasure4 ?? ""),\(_meal.strIngredient5 ?? "") \(_meal.strMeasure5 ?? ""),\(_meal.strIngredient6 ?? "") \(_meal.strMeasure6 ?? ""),\(_meal.strIngredient7 ?? "") \(_meal.strMeasure7 ?? ""),\(_meal.strIngredient8 ?? "") \(_meal.strMeasure8 ?? ""),\(_meal.strIngredient9 ?? "") \(_meal.strMeasure9 ?? ""),\(_meal.strIngredient10 ?? "") \(_meal.strMeasure10 ?? ""),\(_meal.strIngredient11 ?? "") \(_meal.strMeasure11 ?? ""),\(_meal.strIngredient12 ?? "") \(_meal.strMeasure12 ?? ""),\(_meal.strIngredient13 ?? "") \(_meal.strMeasure13 ?? ""),\(_meal.strIngredient14 ?? "") \(_meal.strMeasure14 ?? ""),\(_meal.strIngredient15 ?? "") \(_meal.strMeasure15 ?? ""),\(_meal.strIngredient16 ?? "") \(_meal.strMeasure16 ?? ""),\(_meal.strIngredient17 ?? "") \(_meal.strMeasure17 ?? ""),\(_meal.strIngredient18 ?? "") \(_meal.strMeasure18 ?? ""),\(_meal.strIngredient19 ?? "") \(_meal.strMeasure19 ?? ""),\(_meal.strIngredient20 ?? "") \(_meal.strMeasure20 ?? "")"
    }

}
