//
//  VideoToScriptViewController.swift
//  TestApp
//
//  Created by Max on 25.08.2024.
//

import UIKit

final class VideoToScriptViewController: UIViewController  {
    
    ///Image Background
    private lazy var backgroundBlurImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "VideoScreenshotBlur")
        image.contentMode = .scaleToFill
        
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
        
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundBlurImageView)
        createBackgroundBlurImageViewConstrains()
        
        view.addSubview(imageView)
        createcreateBackgroundImageViewConstrains()
    }
}

//MARK: - Extension
private extension VideoToScriptViewController {
    
    ///Background Image Constrains
    func createBackgroundBlurImageViewConstrains() {
        backgroundBlurImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundBlurImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundBlurImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundBlurImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            //backgroundVideoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -320),
            
            backgroundBlurImageView.heightAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    func createcreateBackgroundImageViewConstrains() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backgroundBlurImageView.topAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: backgroundBlurImageView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: backgroundBlurImageView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: backgroundBlurImageView.bottomAnchor),
        ])
    }
    
}

#Preview {
    VideoToScriptViewController()
}
