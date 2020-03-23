//
//  RBMealsContract.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import Foundation

//La idea de los contratos es que la vista y el presenter no sepan de la logica y acepten cualquier objeto, solo basta con que cumplan las firmas

protocol RBMealsViewContract {
    func loadMeals()
    func showError(description: String)
}

protocol RBMealsPresentContract {
    init(view: RBMealsViewContract, interactor: RBMealsService)
    func retrieveMeals(filter: String?)
    func meal(byIndex index: Int) -> Meal
    func mealCount() -> Int
}
