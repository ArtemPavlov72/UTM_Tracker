//
//  ViewController.swift
//  UTM_Tracker
//
//  Created by Артем Павлов on 26.01.2023.
//

import UIKit

extension UIViewController {
    func setupSubViews(_ subViews: UIView...) {
        subViews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    func setupConstraints(for uiView: UIView) {
        uiView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9)
        ])
    }
}
