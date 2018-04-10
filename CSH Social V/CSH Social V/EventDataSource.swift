//
//  EventDataSource.swift
//  CSH Social III
//
//  Created by Jeff Phillips on 2/24/18.
//  Copyright © 2018 Computer Science House. All rights reserved.
//

import Foundation

class EventDataSource{
    
    private static var events:[Event] = []
    
    static func getEvents() -> [Event]{
        return events
    }
    
    static func createEvent(event: Event) {
        events.append(event)
    }
    
}
