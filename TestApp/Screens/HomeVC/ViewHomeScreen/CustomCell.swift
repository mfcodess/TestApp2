//
//  CustomCell.swift
//  TestApp
//
//  Created by Max on 27.08.2024.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let mouth = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mouth)
        
        mouth.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mouth.centerXAnchor.constraint(equalTo: centerXAnchor),
            mouth.centerYAnchor.constraint(equalTo: centerYAnchor),
               ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
}
