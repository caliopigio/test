//
//  WebServicesHelper.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import Foundation

class WebService: NSObject {
    
    private let baseUrl = "https://ghibliapi.herokuapp.com/"
    
    func getMovies(completion: @escaping ([Film]) -> ()) {
        guard let url = URL(string: baseUrl + "films") else {
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
}
