//
//  UITextField+DoneButton.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import UIKit
import SnapKit

extension UITextField{
    
    /// Добавляет кнопку "Готово" на toolbar клавиатуры
    func addDoneButtonOnKeyboard() {
        let doneToolbar = UIToolbar(
            frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        ).then {
            $0.barStyle = .default
        }
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(
            title: Bundle(for :UIApplication.self).localizedString(forKey: "Done", value: "Done", table: nil),
            style: .done,
            target: self,
            action: #selector(self.doneButtonAction)
        )
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc
    private func doneButtonAction() {
        self.resignFirstResponder()
    }
}

