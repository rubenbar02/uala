//
//  GetMealResponse.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import Foundation

struct RBGetMealsResponse:Decodable {
    let meals: [Meal]?
}
