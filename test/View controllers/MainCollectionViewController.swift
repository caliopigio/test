//
//  MainCollectionViewController.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    private var filmViewModel: FilmViewModel!
    private let reuseIdentifier = "Cell"

    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(FilmCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        navigationItem.title = "Studio Ghibli Films"
        
        filmViewModel = FilmViewModel(identifier: nil)
        
        filmViewModel.modelUpdated = {
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmViewModel.films.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FilmCell
        
    
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }
        
        let item = filmViewModel.films[indexPath.row]
        cell.title.text = item.title
        cell.year.text = item.releaseYear
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        let detailViewController = DetailCollectionViewController(collectionViewLayout: layout)
        let item = filmViewModel.films[indexPath.row]
        
        detailViewController.filmIdentifier = item.identifier
        detailViewController.vehiclesUrl = item.vehiclesUrl.first
        
        showDetailViewController(detailViewController, sender: nil)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 30, height: 100)
    }
}
