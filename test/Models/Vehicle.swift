//
//  Vehicule.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 21/12/20.
//

import Foundation

struct Vehicle: Decodable {
    
    let identifier: String
    let name: String
    let details: String
    let vehicleClass: String
    let length: String
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name = "name"
        case details = "description"
        case vehicleClass = "vehicle_class"
        case length = "length"
    }
}
