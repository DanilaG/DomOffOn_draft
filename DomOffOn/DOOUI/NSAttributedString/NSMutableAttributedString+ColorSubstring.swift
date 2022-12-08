//
//  NSMutableAttributedString+ColorSubstring.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import UIKit

extension NSMutableAttributedString {
    
    /// Задаёт цвет подстроке
    func color(_ color: UIColor, for substring: String) -> NSMutableAttributedString {
        let range = (string as NSString).range(of: substring)
        addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.systemPurple,
            range: range
        )
        return self
    }
}
