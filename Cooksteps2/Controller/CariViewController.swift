//
//  CariViewController.swift
//  Cooksteps2
//
//  Created by Cyntya Rahma Dita on 11/04/22.
//

import UIKit

class CariViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    let searchController = UISearchController()
    
    @IBOutlet weak var cariTableView: UITableView!
    
    var foodList = [Food]()
    var filteredFoods = [Food]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cari"
        
        initList()
        initSearchController()

        // Do any additional setup after loading the view.
    }
    
    func initSearchController()
    {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.scopeButtonTitles = ["All", "Nasi", "Ayam", "Goreng"]
        
        searchController.searchBar.delegate = self

    }
    
    func initList()
    {
        let food1 = Food(id: "1", title: "Nasi Goreng", imageName: "nasgor", subtitle: "Nasi goreng")
        foodList.append(food1)
        
        let food2 = Food(id: "2",title: "Mie Goreng", imageName: "migor", subtitle: "Nasi goreng")
        foodList.append(food2)
        
        let food3 = Food(id: "3",title: "Ayam Goreng", imageName: "ayamgor", subtitle: "Nasi goreng")
        foodList.append(food3)
        
        let food4 = Food(id: "4",title: "Tumis Kangkung", imageName: "kangkung", subtitle: "Nasi goreng")
        foodList.append(food4)
        
        let food5 = Food(id: "5",title: "Tumis Kacang Panjang", imageName: "kacang", subtitle: "Nasi goreng")
        foodList.append(food5)
        
        let food6 = Food(id: "6",title: "Omelete", imageName: "omelete", subtitle: "Nasi goreng")
        foodList.append(food6)
        
        let food7 = Food(id: "7",title: "Sate", imageName: "sate", subtitle: "Nasi goreng")
        foodList.append(food7)
        
        let food8 = Food(id: "8",title: "Soto", imageName: "soto", subtitle: "Nasi goreng")
        foodList.append(food8)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(searchController.isActive)
        {
            return filteredFoods.count
        }
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cariTableViewCellID") as! CariTableViewCell
        
        let thisFood: Food!
        
        if(searchController.isActive)
        {
            thisFood = filteredFoods[indexPath.row]
        }
        else
        {
            thisFood = foodList[indexPath.row]
        }
        
        tableViewCell.title.text = thisFood.title
        tableViewCell.subtitle.text = thisFood.subtitle
        tableViewCell.imageName.image = UIImage(named: thisFood.imageName)
        
        return tableViewCell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        let scopeButton = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        let searchText = searchBar.text!
        
        filterForSearchTextAndScopeButton(searchText: searchText, scopeButton: scopeButton)
    }
    
    func filterForSearchTextAndScopeButton(searchText: String, scopeButton: String = "All")
    {
        filteredFoods = foodList.filter
        {
            food in
            let scopeMatch = (scopeButton == "All" || food.title.lowercased().contains(scopeButton.lowercased()))
            
            if(searchController.searchBar.text != "")
            {
                let searchTextMatch = food.title.lowercased().contains(searchText.lowercased())
                
                return scopeMatch && searchTextMatch
            }
            else
            {
                return scopeMatch
            }
        }
        cariTableView.reloadData()
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
