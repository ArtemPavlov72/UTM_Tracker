//
//  ViewController.swift
//  UTM_Tracker
//
//  Created by Артем Павлов on 25.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Private Properties
    private lazy var urlTextField: UITextField = {
        let url = UITextField()
        url.borderStyle = .roundedRect
        url.placeholder = "Enter URL"
        return url
    }()
    
    private lazy var enterButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("Get utm info of URL", for: .normal)
        button.backgroundColor = .systemGray
        button.setTitleColor(UIColor.systemGray6, for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .highlighted)
        button.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 14.0
        stackView.addArrangedSubview(urlTextField)
        stackView.addArrangedSubview(enterButton)
        return stackView
    }()
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setupSubViews(verticalStackView)
        setupConstraints(for: verticalStackView)
    }
    
    //MARK: - Private Methods    
    @objc private func enterButtonTapped() {
        guard let inputURLText = urlTextField.text, !inputURLText.isEmpty else {return}
        
        let utmVC = UTMViewController()
        utmVC.url = urlTextField.text
        show(utmVC, sender: nil)
    }
}

