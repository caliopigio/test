//
//  MovieViewModel.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import Foundation

class FilmViewModel {
    
    private let webService = WebService()
    
    private(set) var films: [Film]! {
        didSet {
            modelUpdated()
        }
    }
    
    var modelUpdated: (() -> ()) = {}
    
    init(identifier: String?) {
        self.films = []
        
        getRemoteData(identifier: identifier)
    }
    
    // MARK: FilmViewModel
    
    func getRemoteData(identifier: String?) {
        if let identifier = identifier {
            webService.getFilm(identifier) { (films) in
                self.films = films
            }
        } else {
            webService.getFilms { (films) in
                self.films = films
            }
        }
    }
}
