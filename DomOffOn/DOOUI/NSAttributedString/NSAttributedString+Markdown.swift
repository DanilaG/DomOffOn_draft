//
//  NSAttributedString+Markdown.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import UIKit

extension NSAttributedString {
    
    /// Инициализатор NSAttributedString из строки формата markdown
    ///
    /// - Parameters:
    ///     - fromMarkdown: markdown строка
    convenience init(fromMarkdown markdown: String) {
        self.init(try! AttributedString(markdown: markdown))
    }
}
