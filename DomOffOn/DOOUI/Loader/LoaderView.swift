//
//  LoaderView.swift
//  DomOffOn
//
//  Created by Danila on 08.11.2022.
//

import UIKit
import SnapKit

/// View loader-а
final class LoaderView: UIView {

    private enum Const {
        enum Color {
            static let background = UIColor.gray.withAlphaComponent(0.3)
        }
    }
    
    private let spinner = UIActivityIndicatorView(style: .large)
    
    /// Инициализатор view loader-а
    init() {
        super.init(frame: .zero)
        backgroundColor = Const.Color.background
        addSubview(spinner)
        spinner.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        spinner.startAnimating()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
