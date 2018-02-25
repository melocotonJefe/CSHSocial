//
//  EventDataSource.swift
//  CSH Social III
//
//  Created by Jeff Phillips on 2/24/18.
//  Copyright © 2018 Computer Science House. All rights reserved.
//

import Foundation

struct EventDataSource{
    var events:[Event]
    
    init() {
        events = []
        let evnt1 = Event(title: "Tea in the Lounge", time: "Tuesday: 4PM - 6PM", location: "Lounge", rsvp: "Maybe")
        events.append(evnt1)
        
        let evnt2 = Event(title: "American Vandal", time: "Wednesday: 9PM - 11PM", location: "Lounge", rsvp: "Going")
        events.append(evnt2)
        
    }
    func getEvents() -> [Event]{
        return events
    }
}
