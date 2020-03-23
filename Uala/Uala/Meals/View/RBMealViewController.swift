//
//  RBMealViewController.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import UIKit

class RBMealViewController: UIViewController {

    var _presenter: RBMealDetailsPresentContract?
    
    @IBOutlet var descriptionLabel: UITextView!
    @IBOutlet var ingridientsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _presenter?.loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = _presenter?.mealTitle()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RBMealViewController: RBMealDetailsViewContract {
    func loadMeals() {
        descriptionLabel.text = _presenter?.mealDescription()
        ingridientsLabel.text = _presenter?.mealIngridient()
    }
    
    func showError(description: String) {
        //
    }
    
    
}
