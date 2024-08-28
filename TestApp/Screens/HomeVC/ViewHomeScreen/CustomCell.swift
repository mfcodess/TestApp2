//
//  CustomCell.swift
//  TestApp
//
//  Created by Max on 27.08.2024.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let time = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(time)
        createMonthConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createMonthConstrains() {
        time.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            time.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            time.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}


