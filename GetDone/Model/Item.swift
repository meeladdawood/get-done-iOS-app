//
//  Item.swift
//  GetDone
//
//  Created by Meelad Dawood on 1/18/18.
//  Copyright © 2018 Meelad Dawood. All rights reserved.
//

import Foundation

class Item {
    
    let title : String
    let done : Bool
    
    init(task : String) {
        title = task
        done = false
    }
    
}
