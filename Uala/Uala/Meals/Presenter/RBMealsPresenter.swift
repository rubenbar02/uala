//
//  RBMealsPresenter.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import UIKit

class RBMealsPresenter: RBMealsPresentContract {
    var _view: RBMealsViewContract
    var _interactor: RBMealsService
    
    var _meals: [Meal]?
    
    required init(view: RBMealsViewContract, interactor: RBMealsService) {
        _view = view
        _interactor = interactor
    }
    
    
    func retrieveMeals(filter: String?) {
        _interactor.getMeals(byFilter: filter ?? "", successful: { (meals) in
            self._meals = meals
            self._view.loadMeals()
        }) { (error) in
            self._view.showError(description: error)
        }
    }
    
    func meal(byIndex index: Int) -> Meal {
        return _meals![index]
    }
    
    func mealCount() -> Int {
        return _meals?.count ?? 0
    }

}
