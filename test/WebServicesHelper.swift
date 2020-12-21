//
//  WebServicesHelper.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import Foundation

class WebService: NSObject {
    
    private let baseUrl = "https://ghibliapi.herokuapp.com/"
    
    // gets the list of films from the Studio Ghibli
    func getFilms(completion: @escaping ([Film]) -> ()) {
        guard let url = URL(string: baseUrl + "films/") else {
            completion([])
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let films = try? decoder.decode([Film].self, from: data) {
                    completion(films)
                }
            }
        }.resume()
    }
    
    // gets the film with the given identifier
    func getFilm(_ identifier: String, completion: @escaping ([Film]) -> ()) {
        guard let url = URL(string: baseUrl + "films/" + identifier) else {
            completion([])
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let film = try? decoder.decode(Film.self, from: data) {
                    completion([film])
                }
            }
        }.resume()
    }
    
    // gets the list of vehicles from the Studio Ghibli films, or if a film id is given, the vehicules from the given films
    func getVehicules(_ identifier: String? = nil, completion: @escaping ([Vehicle]) -> ()) {
        var string = baseUrl + "vehicles/"
        
        if let identifier = identifier {
            string += identifier
        }
    
        guard let url = URL(string: string) else {
            completion([])
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let vehicules = try? decoder.decode([Vehicle].self, from: data) {
                    completion(vehicules)
                }
            }
        }.resume()
    }
}
