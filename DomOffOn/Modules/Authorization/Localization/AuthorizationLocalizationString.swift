//
//  AuthorizationLocalizationString.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import Foundation

/// Строки для модуля Authorization
final class AuthorizationLocalizationString {
    
    enum Login {
        
        enum Title {
            static let colorSubPart = st("login.title.colorSubPart")
        }
        
        enum PhoneNumber {
            static let title = st("login.phoneNumber.title")
            static let error = st("login.phoneNumber.error")
        }
        
        static let title = st("login.title")
        static let policy = st("login.policy")
        static let button = st("login.button")
    }
}

extension AuthorizationLocalizationString {
    
    static func st(_ key: String) -> String {
        Bundle(
            for: AuthorizationLocalizationString.self)
        .localizedString(
            forKey: key,
            value: nil,
            table: "AuthorizationLocalizable"
        )
    }
}
