//
//  Coordinator.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import UIKit
import Swinject

/// Ядро координатора
protocol CoordinatorCore {
    
    /// Навигатор
    var navigation: UINavigationController { get }
    
    /// Ассемблер
    var assembler: Assembler { get }
}

/// Координатор
protocol Coordinator: CoordinatorCore {
    
    /// Запуск координатора
    func start()
}

extension CoordinatorCore {
    
    /// Resolver
    var resolver: Resolver {
        assembler.resolver
    }
}

extension Coordinator {
    
    /// Координирует к координатору
    ///
    /// - Parameters:
    ///     - to: координатор, который необходимо запустить
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
