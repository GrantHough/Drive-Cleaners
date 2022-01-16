//
//  LaundryHouse.swift
//  LaundryApp
//
//  Created by Neal Malhotra on 1/15/22.
//

import Foundation
import UIKit

struct LaundryHouse: Identifiable, Codable {
    var id: String
    
    
    
    var name: String = ""
    var address: String = ""
    var drying: Bool = false
    var folding: Bool = false
    var soapBrand: String = ""
    var typeOfLoad: String = ""
    
    init(name: String, address: String){
        self.id = ""
        
        self.name = name
        self.address = address
        self.drying = false
        self.folding = false
        self.soapBrand = "Tide"
        self.typeOfLoad = "Delicate"
    }
    
    init(name: String, address: String, drying: Bool, folding: Bool, soapBrand: String, typeOfLoad: String){
        self.id = ""
        
        self.name = name
        self.address = address
        self.drying = drying
        self.folding = folding
        self.soapBrand = soapBrand
        self.typeOfLoad = typeOfLoad
    }
    
}
