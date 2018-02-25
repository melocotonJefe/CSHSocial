//
//  Event.swift
//  CSH Social III
//
//  Created by Jeff Phillips on 2/24/18.
//  Copyright © 2018 Computer Science House. All rights reserved.
//

import Foundation

class Event {
    var title: String!
    var time: String!
    var location: String!
    var rsvp: String!
    
    init(title: String, time: String, location: String, rsvp: String){
        self.title = title
        self.time = time
        self.location = location
        self.rsvp = rsvp
    }
    
}
