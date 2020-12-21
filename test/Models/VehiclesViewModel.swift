//
//  VehiculesViewModel.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 21/12/20.
//

import Foundation

class VehiclesViewModel {
    
    private let webService = WebService()
    
    private(set) var vehicles: [Vehicle]! {
        didSet {
            modelUpdated()
        }
    }
    
    var modelUpdated: (() -> ()) = {}
    
    init(identifier: String? = nil) {
        self.vehicles = []
        
        getRemoteData(identifier: identifier)
    }
    
    // MARK: VehiculesViewModel
    
    func getRemoteData(identifier: String?) {
        webService.getVehicules(identifier) { (vehicules) in
            self.vehicles = vehicules
        }
    }
}
