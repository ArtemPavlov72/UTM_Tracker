//
//  UTMViewController.swift
//  UTM_Tracker
//
//  Created by Артем Павлов on 25.01.2023.
//

import UIKit

class UTMViewController: UIViewController {
    
    //MARK: - Public Properties
    var url: String!
    
    //MARK: - Private Properties
    private var utmDataDict = [String: String]()
    
    private lazy var sourceLabel: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.text = "utm_source:"
        return sourceLabel
    }()
    
    private lazy var sourceDataLabel: UILabel = {
        let sourceDataLabel = UILabel()
        sourceDataLabel.numberOfLines = 0
        return sourceDataLabel
    }()
    
    private lazy var sourceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 14.0
        stackView.addArrangedSubview(sourceLabel)
        stackView.addArrangedSubview(sourceDataLabel)
        return stackView
    }()
    
    private lazy var mediumLabel: UILabel = {
        let mediumLabel = UILabel()
        mediumLabel.text = "utm_medium:"
        return mediumLabel
    }()
    
    private lazy var mediumDataLabel: UILabel = {
        let mediumDataLabel = UILabel()
        mediumDataLabel.numberOfLines = 0
        return mediumDataLabel
    }()
    
    private lazy var mediumStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 14.0
        stackView.addArrangedSubview(mediumLabel)
        stackView.addArrangedSubview(mediumDataLabel)
        return stackView
    }()
    
    private lazy var campaignLabel: UILabel = {
        let campaignLabel = UILabel()
        campaignLabel.text = "utm_campaign:"
        return campaignLabel
    }()
    
    private lazy var campaignDataLabel: UILabel = {
        let campaignDataLabel = UILabel()
        campaignDataLabel.numberOfLines = 0
        return campaignDataLabel
    }()
    
    private lazy var campaignStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 14.0
        stackView.addArrangedSubview(campaignLabel)
        stackView.addArrangedSubview(campaignDataLabel)
        return stackView
    }()
    
    private lazy var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "utm_content:"
        return contentLabel
    }()
    
    private lazy var contentDataLabel: UILabel = {
        let contentDataLabel = UILabel()
        contentDataLabel.numberOfLines = 0
        return contentDataLabel
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 14.0
        stackView.addArrangedSubview(contentLabel)
        stackView.addArrangedSubview(contentDataLabel)
        return stackView
    }()
    
    private lazy var termLabel: UILabel = {
        let termLabel = UILabel()
        termLabel.text = "utm_term:"
        return termLabel
    }()
    
    private lazy var termDataLabel: UILabel = {
        let termDataLabel = UILabel()
        termDataLabel.numberOfLines = 0
        return termDataLabel
    }()
    
    private lazy var termStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 14.0
        stackView.addArrangedSubview(termLabel)
        stackView.addArrangedSubview(termDataLabel)
        return stackView
    }()
    
    private lazy var utmInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 18.0
        stackView.addArrangedSubview(sourceStackView)
        stackView.addArrangedSubview(mediumStackView)
        stackView.addArrangedSubview(campaignStackView)
        stackView.addArrangedSubview(contentStackView)
        stackView.addArrangedSubview(termStackView)
        return stackView
    }()
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        getLabelsInfo(from: url)
        setupSubViews(utmInfoStackView)
        setupConstraints()
        putDataToUTMDataDict()
        print("\(utmDataDict)") // test for watching info from dict of utm specs
    }
    
    //MARK: - Private Methods
    private func getQueryStringParameter(fromUrl: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    private func getLabelsInfo(from url: String) {
        sourceDataLabel.text = getQueryStringParameter(fromUrl: url, param: "utm_source")
        mediumDataLabel.text = getQueryStringParameter(fromUrl: url, param: "utm_medium")
        campaignDataLabel.text = getQueryStringParameter(fromUrl: url, param: "utm_campaign")
        contentDataLabel.text = getQueryStringParameter(fromUrl: url, param: "utm_content")
        termDataLabel.text = getQueryStringParameter(fromUrl: url, param: "utm_term")
    }
    
    private func putDataToUTMDataDict() {
        utmDataDict = [
            "utm_source": "\(sourceDataLabel.text ?? "")",
            "utm_medium": "\(mediumDataLabel.text ?? "")",
            "utm_campaign": "\(campaignDataLabel.text ?? "")",
            "utm_content": "\(contentDataLabel.text ?? "")",
            "utm_term": "\(termDataLabel.text ?? "")"
        ]
    }
    
    private func setupSubViews(_ subViews: UIView...) {
        subViews.forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func setupConstraints() {
        utmInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            utmInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            utmInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            utmInfoStackView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.9)
        ])
    }
}


