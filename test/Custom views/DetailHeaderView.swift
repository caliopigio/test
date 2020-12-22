//
//  DetailHeaderView.swift
//  test
//
//  Created by Carlos Larrañaga Calmet on 21/12/20.
//

import UIKit

class DetailHeaderView: UIView {
        
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    let detailsLabel:  UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        
        return label
    }()
    
    let directorLabel:  UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    let producerLabel:  UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    let yearLabel:  UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    let ratingLabel:  UILabel = {
        let label = UILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        
        return label
    }()
    
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
        stack.spacing = 10
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(detailsLabel)
        stack.addArrangedSubview(directorLabel)
        stack.addArrangedSubview(producerLabel)
        stack.addArrangedSubview(yearLabel)
        stack.addArrangedSubview(ratingLabel)
        
        addSubview(stack)
        
        NSLayoutConstraint.activate(
            [stack.leadingAnchor.constraint(equalTo: leadingAnchor),
             stack.trailingAnchor.constraint(equalTo: trailingAnchor),
             stack.topAnchor.constraint(equalTo: topAnchor),
             stack.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
