//
//  SuccessableResponseDto.swift
//  DomOffOn
//
//  Created by Danila on 07.11.2022.
//

import Foundation

/// Протокол dto ответа с полем success
/// Необходимо для избавления от дублирования кода при работе с беком "Летай"
protocol SuccessableResponseDto: Decodable {
    
    var success: Bool { get }
}

/// Dto ответа с полем success
struct SimpleSuccessableResponseDto: SuccessableResponseDto {
    
    let success: Bool
}

/// Ошибка ответа сервера
struct UnsuccessfulResponse: Error {}

extension SuccessableResponseDto {
    
    /// Выбрасывает исключение в случае ошибки
    @discardableResult
    func checkSuccess() throws -> Self {
        guard success else { throw UnsuccessfulResponse() }
        return self
    }
}
