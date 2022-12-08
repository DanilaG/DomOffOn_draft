//
//  PhoneNumberKit+TelNumber.swift
//  DomOffOn
//
//  Created by Danila on 07.12.2022.
//

import PhoneNumberKit

extension PhoneNumber {
    
    /// Номер телефона в формате domain DOO
    var asTelNumber: TelNumber {
        TelNumber(string: numberString)
    }
}
