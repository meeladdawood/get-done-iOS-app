//
//  Item.swift
//  GetDone
//
//  Created by Meelad Dawood on 1/18/18.
//  Copyright © 2018 Meelad Dawood. All rights reserved.
//

import Foundation

class Item {
    
    var title : String = ""
    var done : Bool = false
    
    init(task : String) {
        title = task
        done = false
    }
    
}
