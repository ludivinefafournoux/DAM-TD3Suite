//
//  Event.swift
//  DAM-TD3
//
//  Created by Laura Daufeld on 23/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import Foundation

class Event {
    
    var id: Int = 0
    var date = Date()
    var name: String = ""
    var flyer: String = ""
    
    init(id: Int, date: Date, name: String, flyer: String) {
        
        self.id = id
        self.date = date
        self.name = name
        self.flyer = flyer
    }

}
