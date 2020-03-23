//
//  RBMealsTableViewController.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import UIKit
import Kingfisher

class RBMealsTableViewController: UITableViewController {
    var _presenter: RBMealsPresentContract?
    let _searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Celdas
        let nib = UINib(nibName: "RBTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mealCell")
        
        // Inicio Search controller
        _searchController.searchResultsUpdater = self
        _searchController.obscuresBackgroundDuringPresentation = false
        _searchController.searchBar.placeholder = "Search Candies"
        navigationItem.searchController = _searchController
        definesPresentationContext = true
        
        _presenter = RBMealsPresenter(view: self,interactor: RBMealsService())
        _presenter?.retrieveMeals(filter: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Recetas"

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _presenter?.mealCount() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as? RBTableViewCell

        cell?.setData(title: _presenter?.meal(byIndex: indexPath.row).strMeal ?? "",
                      category: _presenter?.meal(byIndex: indexPath.row).strCategory ?? "",
                      path: _presenter?.meal(byIndex: indexPath.row).strMealThumb ?? "")

        
        
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "details", sender: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as? RBMealViewController
        let index = tableView.indexPathForSelectedRow?.row ?? 0
        let meal = _presenter?.meal(byIndex: index)

        controller?._presenter = RBMealDetailsPresenter(meal: meal!, view: controller!)
    }
    

}

extension RBMealsTableViewController: RBMealsViewContract {
    func loadMeals() {
        tableView.reloadData()
    }
    
    func showError(description: String) {
        //
    }
    
    
}

extension RBMealsTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = _searchController.searchBar
    _presenter?.retrieveMeals(filter: searchBar.text)

  }
}
