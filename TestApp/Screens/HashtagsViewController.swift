//
//  HashtagsViewController.swift
//  TestApp
//
//  Created by Max on 25.08.2024.
//

import UIKit

class HashtagsViewController: UIViewController {
    ///Fruquecy
    private lazy var frequencyLabel: UILabel = {
        let label = UILabel()
        let atributeString = NSMutableAttributedString(string: "Frequency:")
        atributeString.underline(subString: "Frequency:", style: .single)
        
        label.attributedText = atributeString
        label.textColor = .labelColorr
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        
        return label
    }()
    
    ///Time Week
    private lazy var timeWeekLabel: UILabel = {
        let label = UILabel()
        label.text = " 3 times a week"
        label.textColor = .white
        
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        
        return label
    }()
    
    ///Button Question
    private lazy var questionButton: UIButton = {
        var config = UIButton.Configuration.plain()
        
        let originalImage = UIImage(systemName: "questionmark.circle")
        let resizedImage = originalImage?.resized(to: CGSize(width: 15, height: 15))
        let tintColorImage = resizedImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        config.image = tintColorImage
        let button = UIButton(configuration: config)
        
        return button
    }()
    
    ///StackView Fruquecy, Question
    private lazy var stacViewFrequencyAndQuestion: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .purple
        
        stackView.addArrangedSubview(frequencyLabel)
        stackView.addArrangedSubview(timeWeekLabel)
        stackView.addArrangedSubview(questionButton)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(stacViewFrequencyAndQuestion)
        aa()
       
    }
    
    func aa() {
        stacViewFrequencyAndQuestion.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stacViewFrequencyAndQuestion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stacViewFrequencyAndQuestion.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stacViewFrequencyAndQuestion.widthAnchor.constraint(equalToConstant: 210)
        ])
    }
    
}



#Preview {
    HashtagsViewController()
}
