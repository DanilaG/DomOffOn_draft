//
//  AuthorizationCoordinator.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import Swinject

/// Координатор авторизации
final class AuthorizationCoordinator: ChildCoordinator {
    
    init(parent: CoordinatorCore) {
        super.init(
            assemblies: [
                AuthorizationRepositoryAssembly(),
                LoginAssembly()
            ],
            parent: parent
        )
    }
    
    func start() {
        let module =  resolver.required(LoginModule.self)
        
        navigation.pushViewController(module.viewController, animated: true)
    }
}
