//
//  ViewController.swift
//  todomovie
//
//  Created by Deniz Tunç Tuncer on 16/03/2020.
//  Copyright © 2020 Deniz Tunç Tuncer. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    private let api = Api()
    var searchs: [Search]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search"
        
        searchItem(query: "Tom Hanks")
    }
    
    
    func searchItem(query: String) {
        api.search(query: query) { result in
            switch result {
            case .success(let response):
                self.searchs = response.results
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        if let searchs = searchs {
            let search = searchs[indexPath.row]
            cell.setSearch(search: search)
        }
        
        return cell
    }
}


extension SearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchItem(query: searchBar.text ?? "")
    }
}
