//
//  Global.swift
//  Antswer
//
//  Created by Q Kalantary on 12/8/14.
//  Copyright (c) 2014 Q Kalantary. All rights reserved.
//

import Foundation

class Main {
    var name:String
    init(name:String) {
        self.name = name
    }
    
    func setName(newName:String) {
        self.name = newName
    }
}
var mainInstance = Main(name:"My Global Class")