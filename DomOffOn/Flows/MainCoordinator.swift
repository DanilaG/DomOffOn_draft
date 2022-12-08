//
//  MainCoordinator.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import UIKit
import Swinject

/// Корневой координатор
final class MainCoordinator: Coordinator {
    
    let navigation: UINavigationController
    
    let assembler = Assembler([])
    
    /// Инициализатор корневого координатора
    ///
    /// - Parameters:
    ///     - navigation: навигатор
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let coordinator = AuthorizationCoordinator(parent: self)
        coordinate(to: coordinator)
    }
    
}
