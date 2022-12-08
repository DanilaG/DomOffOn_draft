//
//  MoyaProvider+Async.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import Moya

extension MoyaProvider {
    
    // TODO: добавить поддержку отмены путём создания актора и хендлера отмены таски
    /// Асинхронное выполнение запроса
    ///
    /// - Parameters:
    ///     - target: спецификация запроса
    func request(_ target: Target) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            request(target) { result in
                switch result {
                    case .success(let response):
                        continuation.resume(returning: response)
                        return
                    case .failure(let error):
                        continuation.resume(throwing: error)
                        return
                }
            }
        }
    }
}

