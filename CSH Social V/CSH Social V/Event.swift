//
//  Event.swift
//  CSH Social III
//
//  Created by Jeff Phillips on 2/24/18.
//  Copyright © 2018 Computer Science House. All rights reserved.
//

import Foundation

struct Event {
    var title: String!
    var date: String!
    var location: String!
    var about: String!
    
    init(title: String, date: String,location:String,about:String) {
        self.title = title
        self.date = date
        self.location=location
        self.about=about
    }
    
    /// Returns true if given string matches the title of the Event. 
    func matchesSearchText(_ text: String) -> Bool {
        if title.lowercased().contains(text) {
            return true
        }
        return false
    }
    
}
