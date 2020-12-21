//
//  FilmViewCell.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import UIKit

class FilmCell: UICollectionViewCell {
    
    let title = UILabel()
    let year = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FilmCell
    
    func setupCell() {
        // setting up the title label
        title.backgroundColor = .systemOrange
        title.translatesAutoresizingMaskIntoConstraints = false

        addSubview(title)
        
        NSLayoutConstraint.activate([title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     title.topAnchor.constraint(equalTo: self.topAnchor),
                                     title.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)])
        
        // setting up the year label
        year.backgroundColor = .systemGreen
        year.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(year)
        
        NSLayoutConstraint.activate([year.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     year.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     year.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     year.heightAnchor.constraint(equalTo: title.heightAnchor)])
    }
}
