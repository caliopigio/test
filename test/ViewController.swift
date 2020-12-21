//
//  ViewController.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    private var filmViewModel: FilmViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Ghibli Studio Films"
        
        view.backgroundColor = .systemRed
        
        filmViewModel = FilmViewModel()
        
        filmViewModel.modelUpdated = {
            print(self.filmViewModel!.films!)
        }
    }
}
