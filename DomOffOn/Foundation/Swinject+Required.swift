//
//  Swinject+Required.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import Swinject

extension Resolver {
    
    /// Создаёт объект или вызывает падение приложения, если объект не зарегистрирован
    func required<Service>(_ serviceType: Service.Type) -> Service {
        resolve(serviceType)!
    }
}
