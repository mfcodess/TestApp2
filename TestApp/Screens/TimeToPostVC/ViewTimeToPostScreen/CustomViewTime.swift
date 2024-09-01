//
//  ScheduleModel.swift
//  TestApp
//
//  Created by Max on 26.08.2024.
//


import UIKit

class CustomViewTime: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    lazy var customView: UIView = {
        let view = UIView()
        view.backgroundColor = .viewTimeColorr
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(customView)
        addSubview(label)
        
        // Constraints for customView
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: topAnchor),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        // Constraints for label
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: customView.centerYAnchor)
        ])
    }
}
