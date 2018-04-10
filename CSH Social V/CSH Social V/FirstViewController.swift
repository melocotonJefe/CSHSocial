//
//  FirstViewController.swift
//  CSH Social V
//
//  Created by Jeff Phillips on 2/25/18.
//  Copyright © 2018 Jeff Phillips. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var filteredEvents = [Event]()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetup()
        searchBarSetup()
       
    }
    
    func viewSetup() {
        
        self.title="HOME"
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        // then sets the bar to the app’s theme color,
        navigationController?.navigationBar.barTintColor = UIColor.themeColor
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "BebasNeue", size: 50)!]
        
    }
    
    func searchBarSetup() {
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search Events", attributes: nil)
        searchController.searchBar.tintColor = UIColor.white
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling=true
        
        definesPresentationContext = true
        
    }

    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isSearching() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        if isSearching() {
            return self.filteredEvents.count
        }
        return EventDataSource.getEvents().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        _ = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        let font = UIFont(name: "BebasNeue", size: 24)
        let detailfont = UIFont(name: "BebasNeue", size: 16)
        cell.textLabel?.font = font
        cell.detailTextLabel?.font = detailfont
        
        
        
        if isSearching() {
            cell.textLabel?.text = filteredEvents[indexPath.row].title
            cell.detailTextLabel?.text = EventDataSource.getEvents()[indexPath.row].date
        }
        else {
            cell.textLabel?.text = EventDataSource.getEvents()[indexPath.row].title
            cell.detailTextLabel?.text = EventDataSource.getEvents()[indexPath.row].date
        }
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FirstViewController: UISearchResultsUpdating {
    /// Updates the search results each time text is entered.
    func updateSearchResults(for searchController: UISearchController) {
        filteredEvents = EventDataSource.getEvents().filter { $0.matchesSearchText((searchController.searchBar.text?.lowercased())!) }
        self.tableView.reloadData()
    }
}

extension UIColor {
    @nonobjc static var themeColor: UIColor {
        return #colorLiteral(red: 0.6901960784, green: 0.09803921569, blue: 0.4941176471, alpha: 1)
    }
}
