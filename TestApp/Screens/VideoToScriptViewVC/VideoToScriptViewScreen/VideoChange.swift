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
    
    private var blurVisualEffectViewWidthConstraint: NSLayoutConstraint?
    private var blurVisualEffectViewHeightConstraint: NSLayoutConstraint?
    
    /// Change Insta
    private var viewInstaChangeImage: UIImageView?
    private var viewInstaChangeLabel: UILabel?
    private var viewInstaChange: UIView?
    
    ///Change TikTok
    private var viewTikTokChangeImage: UIImageView?
    private var viewTikTokChangeLabel: UILabel?
    private var viewTikTokChange: UIView?
    
    ///Change YouTube
    private var viewYouTubeChangeImage: UIImageView?
    private var viewYouTubeChangeLabel: UILabel?
    private var viewYouTubeChange: UIView?
    
    ///Change Snapchat
    private var viewSnapchatChangeImage: UIImageView?
    private var viewSnapchatChangeLabel: UILabel?
    private var viewSnapchatChange: UIView?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "VideoScreenshot")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private lazy var backgroundBlurImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VideoScreenshotBlur")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
    
        // Blur
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        var blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        image.addSubview(blurVisualEffectView)
        
        blurVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurVisualEffectView.contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            blurVisualEffectView.topAnchor.constraint(equalTo: image.topAnchor),
            blurVisualEffectView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            blurVisualEffectView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            blurVisualEffectView.bottomAnchor.constraint(equalTo: image.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: blurVisualEffectView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: blurVisualEffectView.centerYAnchor),
            
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 400),
        ])
        
        return image
    }()
    
    private lazy var blurAndImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .red
        
        stackView.addArrangedSubview(backgroundBlurImageView)
        
        return stackView
    }()
    
    ///View Insta
    private lazy var viewInsta: UIView = {
        let view = UIView()
        view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        view.tag = 1
        
        self.viewInstaChange = view
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "InstaFiil")?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .labelColorr
        
        // Сохраняем ссылку на imageView
        self.viewInstaChangeImage = imageView
        
        let label = UILabel()
        label.text = "1:1"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .labelColorr
        
        self.viewInstaChangeLabel = label
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        return view
    }()
    
    ///View TikTok
    private lazy var viewTikTok: UIView = {
        let view = UIView()
        //view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        view.tag = 2
        
        self.viewTikTokChange = view
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TikTok")?.withRenderingMode(.alwaysTemplate) ///withRenderingMode(.alwaysTemplate) заставляет изображение использовать цвет, заданный через свойство tintColor, а не отображать свой оригинальный цвет
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .navigationTabBarColorIcons
        
        self.viewTikTokChangeImage = imageView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        let label = UILabel()
        label.text = "9:16"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .navigationTabBarColorIcons
        
        self.viewTikTokChangeLabel = label
        
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
        //view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        view.tag = 3
        
        self.viewYouTubeChange  = view
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "YouTube")?.withRenderingMode(.alwaysTemplate) ///withRenderingMode(.alwaysTemplate) заставляет изображение использовать цвет, заданный через свойство tintColor, а не отображать свой оригинальный цвет
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .navigationTabBarColorIcons
        
        self.viewYouTubeChangeImage = imageView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        let label = UILabel()
        label.text = "16:9"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .navigationTabBarColorIcons
        
        self.viewYouTubeChangeLabel = label
        
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
        //view.backgroundColor = .navigationTabBar
        view.layer.cornerRadius = 15
        view.tag = 4
        
        self.viewSnapchatChange = view
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewsTappes))
        view.addGestureRecognizer(tapGesture)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Snapchat")?.withRenderingMode(.alwaysTemplate) ///withRenderingMode(.alwaysTemplate) заставляет изображение использовать цвет, заданный через свойство tintColor, а не отображать свой оригинальный цвет
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .navigationTabBarColorIcons
        
        self.viewSnapchatChangeImage = imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        let label = UILabel()
        label.text = "9:16"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        label.textColor = .navigationTabBarColorIcons
        
        self.viewSnapchatChangeLabel = label
        
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
        
        stackView.layer.borderColor = UIColor.gray.cgColor
        stackView.layer.borderWidth = 0.6
        stackView.layer.cornerRadius = 15
        
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
    
    @objc func viewsTappes(sender: UITapGestureRecognizer) {
        if let view = sender.view {
    
            switch view.tag {
            case 1:
                print("Instagram")
                
                viewInstaChangeImage?.image = UIImage(named: "InstaFiil")?.withRenderingMode(.alwaysTemplate)
                viewInstaChangeImage?.tintColor = .labelColorr
                viewInstaChangeLabel?.textColor = .labelColorr
                
                viewTikTokChangeImage?.image = UIImage(named: "TikTok")?.withRenderingMode(.alwaysTemplate)
                viewTikTokChangeImage?.tintColor = .navigationTabBarColorIcons
                viewTikTokChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewYouTubeChangeImage?.image = UIImage(named: "YouTube")?.withRenderingMode(.alwaysTemplate)
                viewYouTubeChangeImage?.tintColor = .navigationTabBarColorIcons
                viewYouTubeChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewSnapchatChangeImage?.image = UIImage(named: "Snapchat")?.withRenderingMode(.alwaysTemplate)
                viewSnapchatChangeImage?.tintColor = .navigationTabBarColorIcons
                viewSnapchatChangeLabel?.textColor = .navigationTabBarColorIcons
                
                
                viewInstaChange?.backgroundColor = .navigationTabBar
                viewTikTokChange?.backgroundColor = .clear
                viewYouTubeChange?.backgroundColor = .clear
                viewSnapchatChange?.backgroundColor = .clear
                
            case 2:
                print("TikTok")
                
                viewInstaChangeImage?.image = UIImage(named: "Insta")?.withRenderingMode(.alwaysTemplate)
                viewInstaChangeImage?.tintColor = .navigationTabBarColorIcons
                viewInstaChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewTikTokChangeImage?.image = UIImage(named: "TikTokFill")?.withRenderingMode(.alwaysTemplate)
                viewTikTokChangeImage?.tintColor = .labelColorr
                viewTikTokChangeLabel?.textColor = .labelColorr
                
                viewYouTubeChangeImage?.image = UIImage(named: "YouTube")?.withRenderingMode(.alwaysTemplate)
                viewYouTubeChangeImage?.tintColor = .navigationTabBarColorIcons
                viewYouTubeChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewSnapchatChangeImage?.image = UIImage(named: "Snapchat")?.withRenderingMode(.alwaysTemplate)
                viewSnapchatChangeImage?.tintColor = .navigationTabBarColorIcons
                viewSnapchatChangeLabel?.textColor = .navigationTabBarColorIcons
                
                
                viewInstaChange?.backgroundColor = .clear
                viewTikTokChange?.backgroundColor = .navigationTabBar
                viewYouTubeChange?.backgroundColor = .clear
                viewSnapchatChange?.backgroundColor = .clear
                
            case 3:
                print("YouTube")
                
                viewInstaChangeImage?.image = UIImage(named: "Insta")?.withRenderingMode(.alwaysTemplate)
                viewInstaChangeImage?.tintColor = .navigationTabBarColorIcons
                viewInstaChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewTikTokChangeImage?.image = UIImage(named: "TikTok")?.withRenderingMode(.alwaysTemplate)
                viewTikTokChangeImage?.tintColor = .navigationTabBarColorIcons
                viewTikTokChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewYouTubeChangeImage?.image = UIImage(named: "YouTubeFill")?.withRenderingMode(.alwaysTemplate)
                viewYouTubeChangeImage?.tintColor = .labelColorr
                viewYouTubeChangeLabel?.textColor = .labelColorr
                
                viewSnapchatChangeImage?.image = UIImage(named: "Snapchat")?.withRenderingMode(.alwaysTemplate)
                viewSnapchatChangeImage?.tintColor = .navigationTabBarColorIcons
                viewSnapchatChangeLabel?.textColor = .navigationTabBarColorIcons
                
                
                viewInstaChange?.backgroundColor = .clear
                viewTikTokChange?.backgroundColor = .clear
                viewYouTubeChange?.backgroundColor = .navigationTabBar
                viewSnapchatChange?.backgroundColor = .clear
                
            case 4:
                print("Snapchat")
                
                viewInstaChangeImage?.image = UIImage(named: "Insta")?.withRenderingMode(.alwaysTemplate)
                viewInstaChangeImage?.tintColor = .navigationTabBarColorIcons
                viewInstaChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewTikTokChangeImage?.image = UIImage(named: "TikTok")?.withRenderingMode(.alwaysTemplate)
                viewTikTokChangeImage?.tintColor = .navigationTabBarColorIcons
                viewTikTokChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewYouTubeChangeImage?.image = UIImage(named: "YouTube")?.withRenderingMode(.alwaysTemplate)
                viewYouTubeChangeImage?.tintColor = .navigationTabBarColorIcons
                viewYouTubeChangeLabel?.textColor = .navigationTabBarColorIcons
                
                viewSnapchatChangeImage?.image = UIImage(named: "SnapchatFill")?.withRenderingMode(.alwaysTemplate)
                viewSnapchatChangeImage?.tintColor = .labelColorr
                viewSnapchatChangeLabel?.textColor = .labelColorr
                
                
                viewInstaChange?.backgroundColor = .clear
                viewTikTokChange?.backgroundColor = .clear
                viewYouTubeChange?.backgroundColor = .clear
                viewSnapchatChange?.backgroundColor = .navigationTabBar
                
            default:
                break
            }
            
            // Обновление макета
            UIView.animate(withDuration: 0.3) { [self] in
                imageViewWidthConstraint?.constant = 130
                imageViewHeightConstraint?.constant = 130
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
