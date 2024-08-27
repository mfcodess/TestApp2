//
//  MenuViewController.swift
//  TestApp
//
//  Created by Max on 25.08.2024.
//

import UIKit



class MenuViewController: UIViewController {

    var month = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    var date = ["5 am", "9 am", "10 am", "4 am", "5 am", "6 am", "6 am", "8"]

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .gray
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        setupConstraints()
        let layout = UICollectionViewFlowLayout()
               layout.itemSize = CGSize(width: 40, height: 50)
               collectionView.collectionViewLayout = layout
    }

    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return month.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.mouth.text = month[indexPath.row]
        cell.backgroundColor = .navigationTabBar
        cell.mouth.textColor = .white
        
        if indexPath.row == 5 {
            let view = UIView()
            view.backgroundColor = .collectionViewBlue
            view.frame = cell.contentView.bounds
            view.alpha = 0.2
            cell.mouth.textColor = .collectionViewBlue
            cell.contentView.addSubview(view)
            
        } else if indexPath.row == 6 {
            cell.backgroundColor = .red
            
        }
      
        return cell
    }
    
}

extension MenuViewController: UICollectionViewDelegate {
    // Реализуйте методы делегата при необходимости
}



#Preview {
    MenuViewController()
}
