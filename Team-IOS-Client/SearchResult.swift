//
//  SearchResult.swift
//  Team-IOS-Client
//
//  Created by fangjia li on 4/25/16.
//  Copyright © 2016 张仁龙. All rights reserved.
//

import Foundation

class Result{
    var address = "address"
    var property = "property"
    var rooms = 0
    var price = 0.00
    var img = "blank"
    
    init(address: String, property: String, rooms:Int, price:Double, img:String){
        self.address = address
        self.property = property
        self.rooms = rooms
        self.price = price
        self.img = img
    }
}