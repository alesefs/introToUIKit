//
//  CollectionViewController.swift
//  introToUIKit
//
//  Created by Alessandro Emanuel Ferreira de Souza on 26/05/24.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyCollectionViewCell"
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
//        label.text = "13:00"
        label.textColor = UIColor.contrastColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//        label.text = "25ºC"
        label.textColor = UIColor.contrastColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var WheaterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel, weatherIcon, temperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.contrastColor?.cgColor
        stackView.layer.cornerRadius = 20
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(time: String?, icon: UIImage?, temp: String?) {
        hourLabel.text = time
        weatherIcon.image = icon
        temperatureLabel.text = temp
    }

    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(WheaterStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            WheaterStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            WheaterStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero),
            WheaterStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            WheaterStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            
            weatherIcon.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
