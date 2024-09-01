//
//  HashtagsViewController.swift
//  TestApp
//
//  Created by Max on 25.08.2024.
//

import UIKit

class HashtagsViewController: UIViewController {
    
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    var time = ["", "", "", "", "", "", ""]
    
    
    
    
    private lazy var collectionViewDays: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        // collectionView.backgroundColor = .gray
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.isScrollEnabled = false
        
        return collectionView
    }()
    
    private lazy var collectionViewTimes: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        //layout.itemSize = CGSize(width: 44, height: 33)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionView.backgroundColor = .red
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    
    
    
    
    
    ///StackView Days, Time
    private lazy var collectionViewDaysAndTimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(collectionViewDays)
        stackView.addArrangedSubview(collectionViewTimes)
        
        return stackView
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(collectionViewDaysAndTimeStackView)
        staclkView()
    }
    
    
    func staclkView() {
        collectionViewDaysAndTimeStackView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewDays.translatesAutoresizingMaskIntoConstraints = false
        collectionViewTimes.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionViewDaysAndTimeStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionViewDaysAndTimeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionViewDaysAndTimeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            
            collectionViewDays.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewDays.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionViewDays.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionViewDays.heightAnchor.constraint(equalToConstant: 35),
            
            collectionViewTimes.topAnchor.constraint(equalTo: collectionViewDays.bottomAnchor),
            collectionViewTimes.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionViewTimes.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            //collectionViewTimes.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
            collectionViewTimes.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
 
    
}

extension HashtagsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewDays {
            return days.count
        } else {
            return time.count // Убедитесь, что массив `time` определён
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.backgroundColor = .navigationTabBar
        cell.time.textColor = .white
        cell.time.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        
        if collectionView == collectionViewDays {
            cell.time.text = days[indexPath.row]
        } else {
            cell.time.text = time[indexPath.row] // Убедитесь, что `time` правильно определён и используется
        }
        
        
        
        switch indexPath.row {
        case 0:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTimes {
                cell.contentView.addSubview(customView)
                customView.label.text = "5 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 1:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTimes {
                cell.contentView.addSubview(customView)
                customView.label.text = "6 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 60),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 2:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTimes {
                cell.contentView.addSubview(customView)
                customView.label.text = "7 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 120),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 3:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTimes {
                cell.contentView.addSubview(customView)
                customView.label.text = "7 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 120),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 4:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTimes {
                cell.contentView.addSubview(customView)
                customView.label.text = "6 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 60),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 5:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTimes {
                cell.contentView.addSubview(customView)
                customView.label.text = "5 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        default:
            break
        }
        
        if indexPath.row == 5 && collectionView == collectionViewDays {
            let view = UIView()
            
            
            
            view.backgroundColor = collectionView == collectionViewDays ? .collectionViewBlue : .collectionViewBlue
            view.alpha = 0.2
            
            cell.time.textColor = collectionView == collectionViewDays ? .collectionViewBlue : .collectionViewBlue
            cell.contentView.addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
            ])
            
            
        } else if indexPath.row == 6 && collectionView == collectionViewDays {
            let view = UIView()
            view.backgroundColor = collectionView == collectionViewDays ? .collectionViewRed : .collectionViewRed
            view.alpha = 0.2
            view.frame = cell.contentView.bounds
            cell.time.textColor = collectionView == collectionViewDays ? .collectionViewRed : .collectionViewRed
            cell.contentView.addSubview(view)
        }
        
        return cell
    }
}

extension HashtagsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == collectionViewDays {
            // Рассчитываем размер ячейки в зависимости от доступного пространства
            let width = (collectionView.bounds.width - 10) / 7
            return CGSize(width: width, height: 36)
        } else {
            
            let width = (collectionView.bounds.width - 10) / 7
            return CGSize(width: width, height: 300)
        }
    }
}

#Preview {
    HashtagsViewController()
}
