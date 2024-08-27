//
//  MenuViewController.swift
//  TestApp
//
//  Created by Max on 25.08.2024.
//

import UIKit

class MenuViewController: UIViewController {

    var month = ["Mon", "Tue", "Wed", "Wed", "Thu", "Fri", "Sat", "Sun"]
    var date = ["5 am", "9 am", "10 am", "4 am", "5 am", "6 am", "6 am", "8"]
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        
        
        var collectionView = UICollectionView()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource =  self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        fff()
    }
    
    func fff() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return month.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
    }
    
    
}

extension MenuViewController: UICollectionViewDelegate {
    
}

#Preview {
    MenuViewController()
}
