//
//  FirstViewController.swift
//  CSH Social V
//
//  Created by Jeff Phillips on 2/25/18.
//  Copyright © 2018 Jeff Phillips. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let manager = EventDataSource()
    var events = [] as [Event]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.events = manager.getEvents()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        
        _ = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        let font = UIFont(name: "BebasNeue", size: 24)
        let detailfont = UIFont(name: "BebasNeue", size: 16)
        cell.textLabel?.font = font
        cell.detailTextLabel?.font = detailfont
        
        cell.textLabel?.text = events[indexPath.row].title
        cell.detailTextLabel?.text = events[indexPath.row].date
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

