//
//  NSMutableAttributedString.swift
//  TestApp
//
//  Created by Max on 26.08.2024.
//

import UIKit

//MARK: - Change Color TableView
extension NSMutableAttributedString {
    func setTextColor(color: UIColor, toSubstring : String) {
        if let range = self.string.range(of: toSubstring) {
            let nsRange = NSRange(range, in: self.string)
            
            self.addAttributes([NSAttributedString.Key.foregroundColor: color], range: nsRange)
        }
    }
}
