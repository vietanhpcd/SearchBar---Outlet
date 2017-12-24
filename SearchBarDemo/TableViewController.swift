//
//  TableViewController.swift
//  SearchBarDemo
//
//  Created by Anhdzai on 12/24/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var array = ["Hà Nội", "Hồ Chí Minh", "Đà Nẵng", "Hưng Yên", "Vĩnh Phúc", "Phú Thọ"]
    var filteredArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredArray = array
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filteredArray[indexPath.row]
        return cell
    }
    
    // Updater filteredArray based text searchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArray = searchText.isEmpty ? array : array.filter { (item: String) -> Bool in
            return (item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil)
        }
        tableView.reloadData()
    }
    // Click cancel searchBar
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text?.removeAll()
        filteredArray = array
        tableView.reloadData()
    }
}
