//
//  DetailHeaderView.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 21/12/20.
//

import UIKit

class DetailHeaderView: UICollectionReusableView {
        
    let titleLabel = UILabel()
    let detailsLabel =  UILabel()
    let directorLabel =  UILabel()
    let producerLabel = UILabel()
    let yearLabel = UILabel()
    let ratingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: DetailHeaderView
    
    func setupHeaderView() {
        let stack = UIStackView(frame: frame)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(detailsLabel)
        stack.addArrangedSubview(directorLabel)
        stack.addArrangedSubview(producerLabel)
        stack.addArrangedSubview(yearLabel)
        stack.addArrangedSubview(ratingLabel)
        
        addSubview(stack)
        
        NSLayoutConstraint.activate([stack.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     stack.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     stack.topAnchor.constraint(equalTo: topAnchor),
                                     stack.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
