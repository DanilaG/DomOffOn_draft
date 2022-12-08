//
//  AuthorizationRepositoryImpl.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import Moya

/// Реализация репозитория авторизации
final class AuthorizationRepositoryImpl: AuthorizationRepository {
    
    private let provider = MoyaProvider<AuthorizationTarget>()
    
    func login(phoneNumber: String) async throws {
        try await provider.request(.login(phoneNumber: phoneNumber))
            .filterSuccessfulStatusCodes()
            .map(SimpleSuccessableResponseDto.self)
            .checkSuccess()
    }
}
