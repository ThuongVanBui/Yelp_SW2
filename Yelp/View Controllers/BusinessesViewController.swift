//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    var businesses: [Business]!
    var searchBar: UISearchBar!
    var searchString:String?
    var name:[String] = []
    var searchActive: Bool = false
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        // Add SearchBar to the NavigationBar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension 
        
        Business.search(with: "") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                var i = 0
                for business in businesses {
                    self.name.insert(business.name!, at: i)
                    i += 1
                }
                self.tableView.reloadData()

            }
        }

        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let filtersVC = navController.viewControllers.first as! FiltersViewController
        filtersVC.delegate = self
    }

}
extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource, FiltersViewControllerDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if businesses != nil{
        return businesses.count
    }else
        {
            return 0
        }
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bussinessCell", for: indexPath) as! BussinessCell
        cell.bussiness = businesses[indexPath.row]
        return cell
    }
    
    func filtersViewController(filterVC: FiltersViewController, didUpdateFilters filters: [String],Deal: Bool,Distance: String) {
        print(filters)
        Business.search(with: "", sort: nil, categories: filters, deals: Deal) { (businesses: [Business]?, error: Error?) in
            if Distance == "Auto" {
                self.businesses = businesses
            }else
            {
                self.businesses.removeAll()
                var i = 0
                for business in businesses!
                {
                if business.distance == Distance
                    {
                        self.businesses.insert(business, at: i)
                        i+=1
                    }
                }
                
            
            }
            self.tableView.reloadData()

            print(Deal)
            print(Distance)
    }
    
    }
    
    
}
extension BusinessesViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        Business.search(with: "") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                    print(business.distance!)
                }
                self.tableView.reloadData()
                
            }
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       let filters = self.name.filter({ (text) -> Bool in
        let temp : NSString = text as NSString
        let range = temp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
        return range.location != NSNotFound
        })
        Business.search(with: "") { (businesses: [Business]?, error: Error?) in
            if filters.count == 0{
                self.businesses = businesses
            }
            else{
                self.searchActive = true
                self.businesses.removeAll()
                var i = 0
                for business in businesses!{
                    for filterName in filters{
                        if business.name == filterName{
                            self.businesses.insert(business, at: i)
                            i+=1
                        }
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//       searchString = searchBar.text
//        searchBar.resignFirstResponder()
//       // doSearch()
//        
//        Business.search(with: searchString!) { (businesses: [Business]?, error: Error?) in
//            if let businesses = businesses {
//                self.businesses = businesses
//                self.tableView.reloadData()
//            
//            }
//  }
    
  //  }
    
}
