//
//  AuthorizationRepositoryAssembly.swift
//  DomOffOn
//
//  Created by Danila on 07.11.2022.
//

import Swinject

/// Сборщик репозитория авторизации
final class AuthorizationRepositoryAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
                
        container.register(AuthorizationRepository.self) { resolver in
            return AuthorizationRepositoryImpl()
        }
    }
}
