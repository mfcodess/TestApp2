//
//  VideoChange.swift
//  TestApp
//
//  Created by Max on 02.09.2024.
//

import UIKit

class VideoChange: UIViewController {
    
    private var imageViewWidthConstraint: NSLayoutConstraint?
    private var imageViewHeightConstraint: NSLayoutConstraint?
    
    
    
    ///Image Background
    private lazy var backgroundBlurImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VideoScreenshotBlur")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        //image.layer.cornerRadius = 30
        

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
    
    
    
    private lazy var blurAndImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing

        stackView.addArrangedSubview(backgroundBlurImageView)
        backgroundBlurImageView.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundBlurImageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageViewWidthConstraint = imageView.widthAnchor.constraint(equalTo: backgroundBlurImageView.widthAnchor)
        imageViewHeightConstraint = imageView.heightAnchor.constraint(equalTo: backgroundBlurImageView.heightAnchor)
        
        NSLayoutConstraint.activate([
            imageViewWidthConstraint!,
            imageViewHeightConstraint!,
            imageView.centerXAnchor.constraint(equalTo: backgroundBlurImageView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: backgroundBlurImageView.centerYAnchor),
            
            backgroundBlurImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            backgroundBlurImageView.heightAnchor.constraint(equalTo: stackView.heightAnchor)
        ])

        return stackView
    }()
    
    
    
    ///View Insta
    private lazy var viewInsta: UIView = {
        let view = UIView()
        view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        view.tag = 1
     
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
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
        view.tag = 2
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
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
        view.tag = 3
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
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
        view.tag = 4
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
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
        
        
        view.addSubview(aspectRatioStackView)
        createAspectRatioStackViewConstarins()
        
        view.addSubview(blurAndImageStackView)
        createBlurAndImageStackViewConstarins()
        
        
    }
    
    var aspectRatioConstraint: NSLayoutConstraint?
    @objc func viewsTappes(sender: UITapGestureRecognizer) {
        if let view = sender.view {
            // Деактивация предыдущего констрейнта соотношения сторон
            aspectRatioConstraint?.isActive = false

            switch view.tag {
            case 1:
                print("Instagram")
                imageViewWidthConstraint?.constant = 70
                imageViewHeightConstraint?.constant = 70
                aspectRatioConstraint = imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0)
                
            case 2:
                print("TikTok")
                imageViewWidthConstraint?.constant = 40
                imageViewHeightConstraint?.constant = 40
                aspectRatioConstraint = imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 9.0/16.0)
                
            case 3:
                print("YouTube")
                imageViewWidthConstraint?.constant = 100
                imageViewHeightConstraint?.constant = 320
                aspectRatioConstraint = nil // YouTube does not need aspectRatioConstraint

            case 4:
                print("Snapchat")
                imageViewWidthConstraint?.constant = 40
                imageViewHeightConstraint?.constant = 40
                aspectRatioConstraint = imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 9.0/16.0)
                
            default:
                break
            }

            // Активация нового констрейнта соотношения сторон, если он был создан
            aspectRatioConstraint?.isActive = true
            
            // Обновление макета
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
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
    func createBlurAndImageStackViewConstarins() {
        blurAndImageStackView.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            blurAndImageStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            blurAndImageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurAndImageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurAndImageStackView.bottomAnchor.constraint(equalTo: aspectRatioStackView.topAnchor),
            
        ])
    }
    func createAspectRatioStackViewConstarins() {
        aspectRatioStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aspectRatioStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 410),
            aspectRatioStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            aspectRatioStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            aspectRatioStackView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
   
   
}

#Preview {
    VideoChange()
}
