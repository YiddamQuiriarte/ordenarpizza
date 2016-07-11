//
//  Pizza.swift
//  Ordernar Pizza
//
//  Created by Yiddam on 11/07/16   .
//  Copyright © 2016 Yiddam. All rights reserved.
//

import Foundation

class Pizza: NSObject {
    var size: String?
    var kindDough: String?
    var kindCheese: String?
    var ingredients = [String: String]()
    
    override init() {
        super.init()
    }
    
    init(size: String, kindDough: String, kindCheese: String) {
        self.size = size
        self.kindDough = kindDough
        self.kindCheese = kindCheese
    }
}
