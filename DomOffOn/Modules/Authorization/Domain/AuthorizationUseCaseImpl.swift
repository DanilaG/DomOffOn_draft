//
//  AuthorizationUseCaseImpl.swift
//  DomOffOn
//
//  Created by Danila on 07.11.2022.
//

import Foundation

/// Реализация use case авторизации
final class AuthorizationUseCaseImpl: AuthorizationUseCase {
    
    private let repository: AuthorizationRepository
    
    /// Инициализатор
    ///
    /// - Parameters:
    ///     - repository: репозиторий авторизации
    init(repository: AuthorizationRepository) {
        self.repository = repository
    }
    
    func login(phoneNumber: TelNumber) async throws {
        try await repository.login(
            phoneNumber: phoneNumber.string
                .replacingOccurrences(of: "+", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: "-", with: "")
        )
    }
}
