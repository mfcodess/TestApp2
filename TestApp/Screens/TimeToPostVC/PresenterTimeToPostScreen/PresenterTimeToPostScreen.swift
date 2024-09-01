//
//  PresenterHomeScreen.swift
//  TestApp
//
//  Created by Max on 26.08.2024.
//

import Foundation

final class TimeToPostPresenter {
    weak var view: TimeToPostViewController?
    
    private var country: [CountryModel] = [
        CountryModel(name: "🇺🇦 Ukraine"),
        CountryModel(name: "🇯🇵 Japan"),
        CountryModel(name: "🇨🇿 Czech"),
        CountryModel(name: "🇫🇷 France"),
        CountryModel(name: "🇺🇸 United States"),
        CountryModel(name: "🇩🇪 Germany"),
        CountryModel(name: "🇪🇸 Spain"),
    ]
    
    private var category: [CategoryModel] =  [
        CategoryModel(name: "Advertisement"),
        CategoryModel(name: "Babies"),
        CategoryModel(name: "Beauty"),
        CategoryModel(name: "Business & Finance"),
        CategoryModel(name: "Campus Life"),
        CategoryModel(name: "Cars"),
        CategoryModel(name: "Cooking")
    ]
    
    
    //Методы getCountries() и getCategory() предоставляют доступ к приватным данным презентера. Они необходимы для безопасного получения данных из ViewController или других частей кода, не нарушая инкапсуляцию.
    func getCountries() -> [CountryModel] {
        return country
    }
    
    func getCategory() -> [CategoryModel] {
        return category
    }
    
}

