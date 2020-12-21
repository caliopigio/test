//
//  Vehicule.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 21/12/20.
//

import Foundation

struct Vehicle: Decodable {
    
    //let identifier: String
    let name: String
    /*let details: String
    let vehiculeClass: String
    let lenght: String*/
    
    enum CodingKeys: String, CodingKey {
        //case identifier = "id"
        case name = "name"
        /*case details = "description"
        case vehiculeClass = "vehicule_class"
        case lenght = "lenght"*/
    }
}
