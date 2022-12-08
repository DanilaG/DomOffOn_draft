//
//  LoginViewController.swift
//  DomOffOn
//
//  Created by Danila on 04.11.2022.
//

import UIKit
import SnapKit
import PhoneNumberKit

/// Входные значения для view входа
protocol LoginViewInput: AnyObject {
    
    /// Показывает требования к номеру телефона
    var showPhoneNumberHint: Bool { get set }
    
    /// Показывать лоудер
    @MainActor
    func showLoading()
    
    /// Скрывать лоудер
    @MainActor
    func hiddenLoading()
}

/// Выходные значения для view входа
protocol LoginViewOutput: AnyObject {
    
    /// Вызывается при попытке входа
    ///
    /// - Parameters:
    ///     - with: номер телефона, если он валидный
    func login(with phoneNumber: TelNumber?)
    
    /// Вызывается при завершении редактирования номера телефона
    ///
    /// - Parameters:
    ///     - with: номер телефона, если он валидный
    func editingCompleted(with phoneNumber: TelNumber?)
}

/// View входа
final class LoginViewController: UIViewControllerWithLoader {
    
    private enum Const {
        
        typealias Text = AuthorizationLocalizationString.Login
        
        enum Animation {
            static let keyboardMove: CGFloat = 0.5
        }
        
        enum Size {
            static let horizontalInset: CGFloat = 20
            static let bottomInset: CGFloat = 12
            
            static let contentHeaderPosition: CGFloat = 1.0 / 3.0
            
            static let headerSpacing: CGFloat = 32
            static let phoneBlockSpacing: CGFloat = 8
            static let footerSpacing: CGFloat = 8
        }
        
        enum Font {
            static let title: UIFont = .systemFont(ofSize: 32, weight: .black)
        }
    }
    
    private let body = UIView()
    
    private let phoneField = RuPhoneNumberTextField().then {
        $0.borderStyle = .roundedRect
        $0.addDoneButtonOnKeyboard()
    }
    
    private let errorLabel = UILabel().then {
        $0.text = Const.Text.PhoneNumber.error
        $0.font = UIFont.preferredFont(forTextStyle: .footnote)
        $0.textColor = .systemRed
        $0.numberOfLines = 0
        $0.isHidden = true
    }
    
    /// Результаты работы view
    let output: LoginViewOutput
    
    /// Инициализатор view входа
    ///
    /// - Parameters:
    ///     - output: результаты работы view
    init(output: LoginViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupSubviews()
        hideKeyboardWhenTappedAround()
        setupKeyboardUpdate()
    }
    
    private func setupSubviews() {
        view.addSubview(body)
        body.snp.makeConstraints {
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(Const.Size.horizontalInset)
        }
        
        let content = makeContent()
        body.addSubview(content)
        content.snp.makeConstraints {
            $0.horizontalEdges.top.equalToSuperview()
        }
        
        let footer = makeFooter()
        body.addSubview(footer)
        footer.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(content.snp.bottom)
            $0.bottom.equalToSuperview().inset(Const.Size.bottomInset)
        }
    }
    
    private func makeContent() -> UIView {
        let view = UIView()
        
        let header = makeHeaderBlock()
        view.addSubview(header)
        header.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.centerY.equalToSuperview()
                .dividedBy(1.0 / Const.Size.contentHeaderPosition / 2.0)
        }
        
        return view
    }
    
    private func makeHeaderBlock() -> UIView {
        let stack = UIStackView().then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = Const.Size.headerSpacing
        }
        
        let titleLabel = UILabel().then {
            $0.attributedText = NSMutableAttributedString(
                string: Const.Text.title
            ).color(UIColor.tintColor, for: Const.Text.Title.colorSubPart)
            $0.font = Const.Font.title
            $0.textAlignment = .center
        }
        stack.addArrangedSubview(titleLabel)
        
        let phoneBlock = makePhoneBlock()
        stack.addArrangedSubview(phoneBlock)
        phoneBlock.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
        return stack
    }
    
    private func makePhoneBlock() -> UIView {
        let stack = UIStackView().then {
            $0.axis = .vertical
            $0.spacing = Const.Size.phoneBlockSpacing
        }
        
        let label = UILabel().then {
            $0.text = Const.Text.PhoneNumber.title
        }
        stack.addArrangedSubview(label)
        
        stack.addArrangedSubview(phoneField)
        phoneField.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview()
        }
        
        stack.addArrangedSubview(errorLabel)
        errorLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
        return stack
    }
    
    private func makeFooter() -> UIView {
        let stack = UIStackView().then {
            $0.axis = .vertical
            $0.spacing = Const.Size.footerSpacing
        }
        
        let text = UITextView().then {
            $0.isUserInteractionEnabled = true
            $0.isScrollEnabled = false
            $0.attributedText = NSAttributedString(fromMarkdown: Const.Text.policy)
            $0.textAlignment = .center
            $0.textColor = .secondaryLabel
            $0.font = UIFont.preferredFont(forTextStyle: .footnote)
        }
        stack.addArrangedSubview(text)
        text.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
        let button = UIButton(type: .system).then {
            $0.configuration = .filled()
            $0.setTitle(Const.Text.button, for: .normal)
            $0.addTarget(self, action: #selector(login), for: .touchUpInside)
            $0.addTarget(self, action: #selector(login), for: .touchUpOutside)
        }
        stack.addArrangedSubview(button)
        button.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }
        
        return stack
    }
    
    @objc private func login() {
        output.login(with: phoneField.phoneNumber?.asTelNumber)
    }
}

// MARK: - Keyboard

extension LoginViewController {
    
    private func setupKeyboardUpdate() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo?  [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        guard let keyboardHeight = keyboardSize?.height else { return }
        let offset = keyboardHeight - view.safeAreaInsets.bottom

        body.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(offset)
        }

        UIView.animate(withDuration: Const.Animation.keyboardMove) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        output.editingCompleted(with: phoneField.phoneNumber?.asTelNumber)
        
        body.snp.updateConstraints {
            $0.verticalEdges.equalTo(view.safeAreaLayoutGuide)
        }

        UIView.animate(withDuration: Const.Animation.keyboardMove) {
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - LoginViewInput

extension LoginViewController: LoginViewInput {
    
    var showPhoneNumberHint: Bool {
        get { errorLabel.isHidden }
        set { errorLabel.isHidden = !newValue }
    }
    
    @MainActor
    func showLoading() {
        loadingStart()
    }
    
    @MainActor
    func hiddenLoading() {
        loadingStop()
    }
}
