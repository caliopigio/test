//
//  VehicleCell.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 22/12/20.
//

import UIKit

class VehicleCell: UICollectionViewCell {
    
    let name: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        
        return label
    }()
    
    let type: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.numberOfLines = 0
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
    
    // MARK: VehicleCell
    
    func setupCell() {
        backgroundColor = .secondarySystemBackground
        
        let stack = UIStackView(frame: frame)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(type)
        
        addSubview(stack)
        
        NSLayoutConstraint.activate(
            [stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
             stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
             stack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
             stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)])
    }
}
