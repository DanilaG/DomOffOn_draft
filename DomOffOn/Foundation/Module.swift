//
//  Module.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import UIKit

/// Модуль
class Module<Input, Output> {
    
    /// View контроллер модуля
    let viewController: UIViewController
    
    /// Входные параметры модуля
    let input: Input
    
    /// Результаты работы модуля
    let output: Output
    
    /// Инициализатор модуля
    ///
    /// - Parameters:
    ///     - viewController: view контроллер модуля
    ///     - input: входные параметры
    ///     - output: результаты работы
    init(viewController: UIViewController, input: Input, output: Output) {
        self.viewController = viewController
        self.input = input
        self.output = output
    }
}
