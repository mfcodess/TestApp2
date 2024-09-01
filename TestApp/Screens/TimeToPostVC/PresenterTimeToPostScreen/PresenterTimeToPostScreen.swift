//
//  PresenterHomeScreen.swift
//  TestApp
//
//  Created by Max on 26.08.2024.
//

import Foundation

final class TimeToPostPresenter {
    weak var view: TimeToPostViewController?
    
    func didTapDropDownCountry() {
        print("Tap Country")
    }
    
    func didTapDropDownCategory() {
        print("Tap Category")
        
    }
}
