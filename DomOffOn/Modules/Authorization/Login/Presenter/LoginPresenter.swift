//
//  LoginPresenter.swift
//  DomOffOn
//
//  Created by Danila on 05.11.2022.
//

import Foundation

/// Presenter модуля входа пользователя
final class LoginPresenter: LoginModuleOutput {
    
    var smsConfirm: (((String) -> Void) -> Void)?
    var onComplete: ((String) -> Void)?
    var onError: (() -> Void)?
    
    weak var view: LoginViewInput?
    
    private let useCase: AuthorizationUseCase
    
    /// Инициализатор модуля входа пользователя
    ///
    /// - Parameters:
    ///     - useCase: use case авторизации
    init(useCase: AuthorizationUseCase) {
        self.useCase = useCase
    }
    
    private func login(phoneNumber: TelNumber) async {
        do {
            await view?.showLoading()
            try await useCase.login(phoneNumber: phoneNumber)
            await view?.hiddenLoading()
        } catch {
            await loadingError()
        }

        await confirm()
    }
    
    @MainActor
    private func loadingError() {
        onError?()
    }
    
    @MainActor
    private func confirm() {
        smsConfirm? { [weak self] in self?.confirm(code: $0) }
    }
    
    private func confirm(code: String) {
        #warning("TODO: запрос на подтверждение")
    }
}

// MARK: - LoginViewOutput

extension LoginPresenter: LoginViewOutput {
    
    func login(with phoneNumber: TelNumber?) {
        guard let phoneNumber = phoneNumber else {
            #warning("TODO: Show alert")
            return
        }
        
        Task { await login(phoneNumber: phoneNumber) }
    }
    
    func editingCompleted(with phoneNumber: TelNumber?) {
        guard phoneNumber != nil else {
            view?.showPhoneNumberHint = true
            return
        }
        
        view?.showPhoneNumberHint = false
    }
}
