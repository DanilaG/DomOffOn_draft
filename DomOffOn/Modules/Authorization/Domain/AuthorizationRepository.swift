//
//  AuthorizationRepository.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import Foundation

/// Репозиторий авторизации
protocol AuthorizationRepository {
    
    /// Login пользователя
    ///
    /// - Parameters:
    ///     - phoneNumber: номер телефона пользователя
    func login(phoneNumber: String) async throws
}
