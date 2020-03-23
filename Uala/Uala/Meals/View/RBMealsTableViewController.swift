//
//  RBMealsTableViewController.swift
//  Uala
//
//  Created by Ruben Barboza on 23/03/2020.
//  Copyright © 2020 Ruben Barboza. All rights reserved.
//

import UIKit

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

        // Configure the cell...
        cell?.title.text = _presenter?.meal(byIndex: indexPath.row).strMeal
        return cell!
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
