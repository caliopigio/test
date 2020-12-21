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
        let stack = UIStackView(frame: frame)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(year)
        
        addSubview(stack)
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     stack.topAnchor.constraint(equalTo: topAnchor),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
