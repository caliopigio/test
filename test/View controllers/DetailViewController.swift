//
//  DetailCollectionViewController.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 21/12/20.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var filmIdentifier: String!
    var vehiclesUrl: URL!
    private var filmViewModel: FilmViewModel!
    private var vehiclesViewModel: VehiclesViewModel!
    
    var collectionView: UICollectionView!
    var headerView: DetailHeaderView!
    
    private let reuseIdentifier = "Cell"
    private let reuseHeaderIdentifier = "Header"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        // set up header view
        headerView = DetailHeaderView()
        
        // set up the collection view
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 100)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self

        // Register cell classes
        collectionView.register(VehicleCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(DetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
        
        // layout the views
        let vehiclesLabel = UILabel()
        
        vehiclesLabel.translatesAutoresizingMaskIntoConstraints = false
        vehiclesLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        vehiclesLabel.textColor = .label
        vehiclesLabel.text = "Vehicles"
        
        let stack = UIStackView(arrangedSubviews: [headerView, vehiclesLabel, collectionView])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .vertical
        view.addSubview(stack)
        NSLayoutConstraint.activate(
            [stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
             stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
             stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
             collectionView.heightAnchor.constraint(equalToConstant: 100)])
        
        // setup view models
        filmViewModel = FilmViewModel(identifier: filmIdentifier)
        
        filmViewModel.modelUpdated = {
            OperationQueue.main.addOperation {
                if let film = self.filmViewModel.films.first {
                    self.headerView.titleLabel.text = film.title
                    self.headerView.detailsLabel.text = film.details
                    self.headerView.directorLabel.text = "Director: " + film.director
                    self.headerView.producerLabel.text = "Producer: " + film.producer
                    self.headerView.yearLabel.text = "Released: " + film.releaseYear
                    self.headerView.ratingLabel.text = "Rating: " + film.rating
                }
            }
        }
        
        vehiclesViewModel = VehiclesViewModel()
        
        vehiclesViewModel.modelUpdated = {
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vehiclesViewModel.vehicles.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! VehicleCell
    
        // Configure the cell
        let vehicle = vehiclesViewModel.vehicles[indexPath.row]
        
        cell.name.text = vehicle.name
        cell.type.text = "Class: " + vehicle.vehicleClass
    
        return cell
    }
}
