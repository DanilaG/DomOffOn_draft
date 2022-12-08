//
//  AuthorizationTarget.swift
//  DomOffOn
//
//  Created by Danila on 06.11.2022.
//

import Moya

/// Таргеты авторизации
public enum AuthorizationTarget {
    
    /// Login пользователя
    ///
    /// - Parameters:
    ///     - phoneNumber: номер телефона пользователя
    case login(phoneNumber: String)
}

extension AuthorizationTarget: TargetType {
    
    public var baseURL: URL {
        URL(string:  "https://domofon.tattelecom.ru//v1/")!
    }
    
    public var path: String {
        switch self {
            case .login:
                return "subscriber/signin/"
        }
    }
    
    public var method: Moya.Method {
        .post
    }
    
    public var task: Moya.Task {
        switch self {
            case .login(let phoneNumber):
                return .requestParameters(
                    parameters: [
                        "device_code": UIDevice.current.identifierForVendor?.uuidString ?? "",
                        "phone": phoneNumber,
                        "device_os": "2"
                    ],
                    encoding: JSONEncoding.default
                )
        }
    }
    
    public var headers: [String : String]? {
        [:]
    }
}
