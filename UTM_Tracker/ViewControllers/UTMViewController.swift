//
//  UTMViewController.swift
//  UTM_Tracker
//
//  Created by Артем Павлов on 25.01.2023.
//

import UIKit

class UTMViewController: UIViewController {
    
    //MARK: - Public Properties
    var url: String?
    
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
        getLabelsInfo(from: url ?? "")
        setupSubViews(utmInfoStackView)
        setupConstraints(for: utmInfoStackView)
        putDataToUTMDataDict()
        print("\(utmDataDict)") // test for watching info from dict of utm specs
    }
    
    //MARK: - Private Methods
    private func getQueryStringParameter(fromURL: String, parameter: String) -> String? {
        guard let url = url else { return nil }
        guard let urlCompData = URLComponents(string: url) else { return nil }
        return urlCompData.queryItems?.first(where: { $0.name == parameter })?.value
    }
    
    private func getLabelsInfo(from url: String) {
        sourceDataLabel.text = getQueryStringParameter(fromURL: url, parameter: "utm_source")
        mediumDataLabel.text = getQueryStringParameter(fromURL: url, parameter: "utm_medium")
        campaignDataLabel.text = getQueryStringParameter(fromURL: url, parameter: "utm_campaign")
        contentDataLabel.text = getQueryStringParameter(fromURL: url, parameter: "utm_content")
        termDataLabel.text = getQueryStringParameter(fromURL: url, parameter: "utm_term")
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
}


