//
//  SecondViewController.swift
//  CSH Social V
//
//  Created by Jeff Phillips on 2/25/18.
//  Copyright © 2018 Jeff Phillips. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        //clear the text fields on submit
        eventNameField.text!=""
        timeField.text!=""
        locationField.text!=""
        aboutField.text!=""
    }
    
}

