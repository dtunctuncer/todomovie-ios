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
    public var api: Api!
    var searchs: [Search]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      if let indexPath = tableView.indexPathForSelectedRow {
        tableView.deselectRow(at: indexPath, animated: true)
      }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard
        segue.identifier == "ShowMovieSegue",
        let indexPath = tableView.indexPathForSelectedRow,
        let detailViewController = segue.destination as? MovieViewController else { return }
        if let searchs = searchs {
            let search: Search = searchs[indexPath.row]
                detailViewController.search = search
        }
      
    }
    
    
    func searchItem(query: String) {
        api.search(query: query) { result in
            switch result {
            case .success(let response):
                self.searchs = response.results
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
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


extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        searchItem(query: searchBar.text ?? "")
    }
}
