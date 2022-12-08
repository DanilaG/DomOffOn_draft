//
//  AuthorizationUseCase.swift
//  DomOffOn
//
//  Created by Danila on 07.11.2022.
//

import Foundation

/// Use case авторизации
protocol AuthorizationUseCase {
    
    /// Login пользователя
    ///
    /// - Parameters:
    ///     - phoneNumber: номер телефона пользователя
    func login(phoneNumber: TelNumber) async throws
}
