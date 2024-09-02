//
//  VideoChange.swift
//  TestApp
//
//  Created by Max on 02.09.2024.
//

import UIKit

class VideoChange: UIViewController {
    
    ///Image Background
    private lazy var backgroundBlurImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VideoScreenshotBlur")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        

        //Blur
        let blurEffect = UIBlurEffect(style: .dark)
        let blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        image.addSubview(blurVisualEffectView)

        blurVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blurVisualEffectView.topAnchor.constraint(equalTo: image.topAnchor),
            blurVisualEffectView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            blurVisualEffectView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            blurVisualEffectView.bottomAnchor.constraint(equalTo: image.bottomAnchor),
        ])

        return image
    }()

    ///Image
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VideoScreenshot")
        imageView.contentMode = .scaleAspectFit
        //image.clipsToBounds = true
        return imageView
    }()
    
    
    
    ///View Insta
    private lazy var viewInsta: UIView = {
        let view = UIView()
        view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Insta")?.withRenderingMode(.alwaysTemplate) ///withRenderingMode(.alwaysTemplate) заставляет изображение использовать цвет, заданный через свойство tintColor, а не отображать свой оригинальный цвет
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .navigationTabBarColorIcons
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])

        let label = UILabel()
        label.text = "1:1"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .navigationTabBarColorIcons
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
        ])
        
        return view
    }()
    
    ///View TikTok
    private lazy var viewTikTok: UIView = {
        let view = UIView()
        view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TikTokFill")?.withRenderingMode(.alwaysTemplate) ///withRenderingMode(.alwaysTemplate) заставляет изображение использовать цвет, заданный через свойство tintColor, а не отображать свой оригинальный цвет
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .labelColorr
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])

        let label = UILabel()
        label.text = "9:16"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .labelColorr
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
        ])
        
        return view
    }()
    
    ///View YouTube
    private lazy var viewYouTube: UIView = {
        let view = UIView()
        view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "YouTube")?.withRenderingMode(.alwaysTemplate) ///withRenderingMode(.alwaysTemplate) заставляет изображение использовать цвет, заданный через свойство tintColor, а не отображать свой оригинальный цвет
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .navigationTabBarColorIcons
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])

        let label = UILabel()
        label.text = "16:9"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .navigationTabBarColorIcons
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
        ])
        
        return view
    }()
    
    ///View Snapchat
    private lazy var viewSnapchat: UIView = {
        let view = UIView()
        view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Snapchat")?.withRenderingMode(.alwaysTemplate) ///withRenderingMode(.alwaysTemplate) заставляет изображение использовать цвет, заданный через свойство tintColor, а не отображать свой оригинальный цвет
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .navigationTabBarColorIcons
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])

        let label = UILabel()
        label.text = "9:16"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .navigationTabBarColorIcons
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
        ])
        
        return view
    }()
    
    
    ///StackView Aspect ratio
    private lazy var aspectRatioStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        //stackView.backgroundColor = .red
        
        stackView.addArrangedSubview(viewInsta)
        stackView.addArrangedSubview(viewTikTok)
        stackView.addArrangedSubview(viewYouTube)
        stackView.addArrangedSubview(viewSnapchat)
        
        return stackView
    }()
   

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.insertSublayer(setupUI(), at: 0)
        
        view.addSubview(backgroundBlurImageView)
        createBackgroundBlurImageViewConstrains()

        view.addSubview(imageView)
        createcreateBackgroundImageViewConstrains()
        
        view.addSubview(aspectRatioStackView)
        createAspectRatioStackViewConstarins()
    }
    
    @objc func tapSegment() {
        
    }
    func setupUI() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        ///Color view
        let colorView: UIColor = .viewColorr
        gradientLayer.colors = [colorView.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        return gradientLayer
    }
}

//MARK: - Extension
private extension VideoChange {
    
    ///Background Image Constrains
    func createBackgroundBlurImageViewConstrains() {
        backgroundBlurImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundBlurImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundBlurImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundBlurImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //backgroundVideoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -320),
            
            backgroundBlurImageView.heightAnchor.constraint(equalToConstant: 410)
        ])
    }
    
    func createcreateBackgroundImageViewConstrains() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backgroundBlurImageView.topAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: backgroundBlurImageView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: backgroundBlurImageView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: backgroundBlurImageView.bottomAnchor, constant: 25),
        ])
    }
    
    func createAspectRatioStackViewConstarins() {
        aspectRatioStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aspectRatioStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            aspectRatioStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            aspectRatioStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            aspectRatioStackView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
   
   
}

#Preview {
    VideoChange()
}
