//
//  ChildCoordinator.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import UIKit
import Swinject

/// Ядро дочернего координатора
class ChildCoordinatorCore: CoordinatorCore {
    
    let navigation: UINavigationController
    let assembler: Assembler
    
    /// Инициализатор дочернего координатора
    ///
    /// - Parameters:
    ///     - assemblies: ассемблер, расширяющий родительский ассемблер
    ///     - parent: родительский координатор
    init(assemblies: [Assembly] = [], parent: CoordinatorCore) {
        self.navigation = parent.navigation
        self.assembler = Assembler(assemblies, parent: parent.assembler)
    }
}

/// Дочерний координатор
typealias ChildCoordinator = ChildCoordinatorCore & Coordinator
