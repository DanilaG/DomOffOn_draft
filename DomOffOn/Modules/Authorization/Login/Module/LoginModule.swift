//
//  LoginModule.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import Foundation

/// Модуль входа пользователя
public protocol LoginModuleOutput {
    
    /// Замыкание вызываемое при завершении работы модуля
    ///
    /// - Parameters:
    ///     - введённый номер телефона
    var onComplete: ((String) -> Void)? { get set }
    
    var smsConfirm: (((String) -> Void) -> Void)? { get set }
    
    var onError: (() -> Void)? { get set }
}

typealias LoginModule = Module<Void, LoginModuleOutput>
