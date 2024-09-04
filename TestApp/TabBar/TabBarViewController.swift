//
//  TabBarViewController.swift
//  TestApp
//
//  Created by Max on 24.08.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    //MARK:  - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTabBarVC()
        
        view.layer.insertSublayer(setupUI(), at: 0)
        
        tabBar.tintColor = .white
        colorAppearanceTabBar()
    }
}

//MARK:  - Extension
private extension TabBarViewController {
    
    ///SetupUI
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
    
    /// NavigationVC
    func navigationTabBarVC() {
        let homeVC = HomeViewController()
        let timeToPostVC = TimeToPostViewController()
        let videoToScript = VideoToScriptViewController()
        let hashtagsVC = HashtagsViewController()
        let menuVC =  MenuViewController()
        
        let navigationHomeVC = UINavigationController(rootViewController: homeVC)
        navigationHomeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle.fill"), tag: 0)
        
        let navigationTimeToPostVC = UINavigationController(rootViewController: timeToPostVC)
        navigationTimeToPostVC.tabBarItem = UITabBarItem(title: "Time to post", image: UIImage(systemName: "timer.circle.fill"), tag: 1)
        
        let navigationVideoToScriptVC = UINavigationController(rootViewController: videoToScript)
        navigationVideoToScriptVC.tabBarItem = UITabBarItem(title: "Video to Script", image: UIImage(systemName: "square.and.pencil.circle.fill"), tag: 2)
        
        let navigationHashtagsVC = UINavigationController(rootViewController: hashtagsVC)
        navigationHashtagsVC.tabBarItem = UITabBarItem(title: "Hashtags", image: UIImage(systemName: "number.circle.fill"), tag: 3)
        
        let navigationMenuVC = UINavigationController(rootViewController: menuVC)
        navigationMenuVC.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(systemName: "ellipsis.circle.fill"), tag: 4)
        
        viewControllers = [navigationHomeVC, navigationTimeToPostVC, navigationVideoToScriptVC, navigationHashtagsVC, navigationMenuVC]
    }
    
    ///Color Appearance TabBar
    func colorAppearanceTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .navigationTabBar
        
        let iconAppearance = UITabBarItemAppearance()
        iconAppearance.normal.iconColor = .navigationTabBarColorIcons
        iconAppearance.selected.iconColor = .labelColorr
        iconAppearance.normal.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.navigationTabBarColorIcons
        ]
        iconAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.labelColorr
        ]
        
        appearance.stackedLayoutAppearance = iconAppearance
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}

#Preview {
    TabBarViewController()
}
