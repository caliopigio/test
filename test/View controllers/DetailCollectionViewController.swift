//
//  DetailCollectionViewController.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 21/12/20.
//

import UIKit

class DetailCollectionViewController: UICollectionViewController {
    
    var filmIdentifier: String!
    var vehiclesUrl: URL!
    private var filmViewModel: FilmViewModel!
    private var vehiclesViewModel: VehiclesViewModel!
    private let reuseIdentifier = "Cell"
    private let reuseHeaderIdentifier = "Header"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView!.register(DetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
        
        filmViewModel = FilmViewModel(identifier: filmIdentifier)
        
        filmViewModel.modelUpdated = {
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
        }
        
        vehiclesViewModel = VehiclesViewModel()
        
        vehiclesViewModel.modelUpdated = {
            print(self.vehiclesViewModel.vehicles)
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as! DetailHeaderView
        
        header.backgroundColor = .systemYellow
        
        let film = filmViewModel.films.first
        
        header.titleLabel.text = film?.title
        header.detailsLabel.text = film?.details
        header.directorLabel.text = film?.director
        header.producerLabel.text = film?.producer
        header.yearLabel.text = film?.releaseYear
        header.ratingLabel.text = film?.rating
        
        return header
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension DetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width - 30, height: 100)
    }
}
