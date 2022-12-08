//
//  UIViewController+KeyboardHidden.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import UIKit

extension UIViewController {
    
    /// Устанавливает скрытие клавиатуры по тапу в пустоту
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
