//
//  UIViewControllerWithLoader.swift
//  DomOffOn
//
//  Created by Danila on 07.12.2022.
//

import UIKit
import SnapKit

/// View controller с view лоудера
class UIViewControllerWithLoader: UIViewController {
    
    private var loader: LoaderView?
    
    /// Показ лоудера
    func loadingStart() {
        let loader = LoaderView()
        view.addSubview(loader)
        loader.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        self.loader = loader
    }
    
    /// Оканчание показа лоудера
    func loadingStop() {
        loader?.removeFromSuperview()
        loader = nil
    }
}
