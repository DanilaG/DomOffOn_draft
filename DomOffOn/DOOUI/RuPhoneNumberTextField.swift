//
//  RuPhoneNumberTextField.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import UIKit
import PhoneNumberKit

/// Input для российских номеров телефона
final class RuPhoneNumberTextField: PhoneNumberTextField {
    
    override var defaultRegion: String {
        get {
            return "RU"
        }
        set {} // exists for backward compatibility
    }
    
    /// Инициализатор input-а для российских номеров телефона
    init() {
        super.init(frame: .zero)
        self.withPrefix = true
        self.withExamplePlaceholder = true
        self.maxDigits = 10
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
