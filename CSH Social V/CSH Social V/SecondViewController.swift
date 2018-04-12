//
//  SecondViewController.swift
//  CSH Social V
//
//  Created by Jeff Phillips on 2/25/18.
//  Copyright © 2018 Jeff Phillips. All rights reserved.
//

import UIKit
import SQLite

class SecondViewController: UIViewController, UITextFieldDelegate{

    var database: Connection!
    let eventTable = Table("events")
    let eventName = Expression<String>("name")
    let eventTime = Expression<String>("time")
    let eventLocation = Expression<String>("location")
    let eventAbout = Expression<String>("about")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            //Sets up file to store the database in
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            //Creates path to the file
            let fileURL = documentDirectory.appendingPathComponent("events").appendingPathExtension("sqlite3")
            
            //Trys to connect the database to the file it will be stored in
            let database = try Connection(fileURL.path)
            self.database = database
        }catch{
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var eventNameField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var aboutField: UITextField!
    
    @IBAction func Submit(_ sender: UIButton) {
        let event = Event(title:eventNameField.text!,date:timeField.text!,location:locationField.text!,about:aboutField.text!)
        EventDataSource.createEvent(event: event)
        
        let createTable = self.eventTable.create { (table) in
            table.column(self.eventName, primaryKey: true)
            table.column(self.eventTime)
            table.column(self.eventLocation)
            table.column(self.eventAbout)
        }
        
        do{
            try self.database.run(createTable)
            print("Created Table")
        }catch{
            print(error)
        }
        
        
        //clear the text fields on submit
        eventNameField.text!=""
        timeField.text!=""
        locationField.text!=""
        aboutField.text!=""
    }
    
}

