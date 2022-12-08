//
//  LoginAssembly.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import Swinject

/// Сборщик модуля входа пользователя
final class LoginAssembly: Assembly {
    
    func assemble(container: Swinject.Container) {
                
        container.register(LoginModule.self) { resolver in
            
            let repository = resolver.required(AuthorizationRepository.self)
            let useCase = AuthorizationUseCaseImpl(repository: repository)
            let presenter = LoginPresenter(useCase: useCase)
            let viewController = LoginViewController(output: presenter)
            
            presenter.view = viewController
            
            return LoginModule(
                viewController: viewController,
                input: (),
                output: presenter
            )
        }
    }
}
