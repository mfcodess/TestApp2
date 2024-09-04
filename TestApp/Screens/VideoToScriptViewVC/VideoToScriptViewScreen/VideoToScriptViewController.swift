//
//  VideoToScriptViewController.swift
//  TestApp
//
//  Created by Max on 25.08.2024.
//

import UIKit

final class VideoToScriptViewController: UIViewController  {
    
    private lazy var navigationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Click", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapClick), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navigationButton)
        
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            navigationButton.heightAnchor.constraint(equalToConstant: 100),
            navigationButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc func tapClick() {
        let vc = VideoChange()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

#Preview {
    VideoToScriptViewController()
}
