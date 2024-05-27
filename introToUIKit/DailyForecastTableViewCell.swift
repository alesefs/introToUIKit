//
//  DailyForecastTableViewCell.swift
//  introToUIKit
//
//  Created by Alessandro Emanuel Ferreira de Souza on 26/05/24.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let identifier: String = "DailyForecast"
    
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
//        label.text = "TER"
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "cloudIcon")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
//        label.text = "min 25ºC"
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
//        label.text = "max 25ºC"
        label.textColor = UIColor.contrastColor
        return label
    }()
    
    private lazy var wheaterStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel, weatherIcon, minTemperatureLabel, maxTemperatureLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
//        stackView.layer.borderWidth = 1
//        stackView.layer.borderColor = UIColor.contrastColor?.cgColor
//        stackView.layer.cornerRadius = 20
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        backgroundColor = .blue
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(weekDay: String?, min: String?, max: String?, icon: UIImage?) {
        weekDayLabel.text = weekDay
        minTemperatureLabel.text = "min \(min ?? "")"
        maxTemperatureLabel.text = "max \(max ?? "")"
        weatherIcon.image = icon
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        contentView.addSubview(wheaterStackView)
        
        NSLayoutConstraint.activate([
            weekDayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50)
        ])
    }
    
    private func setConstraints() {
        wheaterStackView.setConstraintsToParent(contentView)
    }
}
