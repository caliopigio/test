//
//  FilmViewCell.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 20/12/20.
//

import UIKit

class FilmCell: UICollectionViewCell {
    
    let title: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        
        return label
    }()
    
    let year: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FilmCell
    
    func setupCell() {
        backgroundColor = .secondarySystemBackground
        
        let stack = UIStackView(frame: frame)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(year)
        
        addSubview(stack)
        
        NSLayoutConstraint.activate(
            [stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
             stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
             stack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
             stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)])
    }
}
