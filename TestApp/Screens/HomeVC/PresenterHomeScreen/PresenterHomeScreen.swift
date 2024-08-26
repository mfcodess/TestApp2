//
//  PresenterHomeScreen.swift
//  TestApp
//
//  Created by Max on 26.08.2024.
//

import Foundation

final class HomePresenter {
    weak var view: HomeViewController?
    
    func didTapDropDownCountry() {
        print("Tap Country")
    }
    
    func didTapDropDownCategory() {
        print("Tap Category")
        
    }
}
