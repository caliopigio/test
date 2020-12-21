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
    
    init() {
        self.films = []
        
        getRemoteData()
    }
    
    // MARK: FilmViewModel
    
    func getRemoteData() {
        webService.getMovies { (films) in
            self.films = films
        }
    }
}
