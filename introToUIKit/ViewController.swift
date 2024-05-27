//
//  ViewController.swift
//  introToUIKit
//
//  Created by Alessandro Emanuel Ferreira de Souza on 25/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
  
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var backgroundView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
//        imageView.image = UIImage(named: "Background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "contrastColor")
        view.layer.cornerRadius = 20
        view.dropShadow(scale: true)
        return view
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
//        label.text = "Recife"
        label.textColor = UIColor(named: "blueColor")
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
//        label.text = "25ºC"
        label.textColor = UIColor(named: "blueColor")
        label.textAlignment = .left
        return label
    }()
    
    private lazy var weatherIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Umidade"
        label.textColor = UIColor(named: "contrastColor")
        label.textAlignment = .left
        return label
    }()
    
    private lazy var humidityValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
//        label.text = "1000mm"
        label.textColor = UIColor(named: "contrastColor")
        label.textAlignment = .left
        return label
    }()
    
    private lazy var humidityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.dropShadow(scale: true)
        return stackView
    }()
    
    private lazy var windLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "Vento"
        label.textColor = UIColor(named: "contrastColor")
        label.textAlignment = .left
        return label
    }()
    
    private lazy var windValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
//        label.text = "10km/h"
        label.textColor = UIColor(named: "contrastColor")
        label.textAlignment = .left
        return label
    }()
    
    private lazy var windStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [windLabel, windValueLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [humidityStackView, windStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 3
        stackView.backgroundColor = UIColor(named: "softGray")
        stackView.layer.cornerRadius = 10
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        
        return stackView
    }()
    
    private lazy var hourlyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "contrastColor")
        label.text = "Previsão por hora"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var hourlyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 67, height: 84)
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 12, bottom: .zero, right: 12)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(HourlyCollectionViewCell.self, forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var dailyForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "contrastColor")
        label.text = "Próximos dias"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var dailyForecastTableView: ContentSizedTableView = {
        let tableView = ContentSizedTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.invalidateIntrinsicContentSize()
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.isScrollEnabled = false
        tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
//        tableView.register(DailyForecastTableViewCell.self, forCellReuseIdentifier: "id")
        tableView.separatorColor = UIColor.contrastColor
        return tableView
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.font = UIFont.preferredFont(forTextStyle: .title1) // title1, larger, title2 medium, title3 smaller
        return label
    }()
    
    private lazy var loaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    private let service = Service()
    private var city = City(lat: "-23.6814346", lon: "-46.9249599", name: "São Paulo")
    private var forecastResponse: ForecastResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    private func fetchData() {
        showLoader()
        
        service.fetchData(city: city) { [weak self] response in
            self?.forecastResponse = response
            DispatchQueue.main.async {
                self?.loadData()
            }
        }
    }
    
    private func loadData() {
        cityLabel.text = city.name
        
        temperatureLabel.text = forecastResponse?.current.temp.toCelsius()
        humidityValueLabel.text = "\(forecastResponse?.current.humidity ?? 0)mm"
        windValueLabel.text = "\(forecastResponse?.current.windSpeed ?? 0)km/h"
        weatherIcon.image = UIImage(named: forecastResponse?.current.weather.first?.icon ?? "")
        
        if forecastResponse?.current.dt.isDayTime() ?? true {
            backgroundView.image = UIImage(named:"background-day")
        } else {
            backgroundView.image = UIImage(named: "background-night")
        }
        
        hourlyCollectionView.reloadData()
        dailyForecastTableView.reloadData()
        
        hideLoader()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setHierachy()
        setConstraints()
    }
    
    private func setHierachy() {
        view.addSubview(backgroundView)
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        scrollView.addSubview(contentView)
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(500)
        NSLayoutConstraint.activate([
          contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
          contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
          contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
          contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
          contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
          heightConstraint,
        ])
        
//        view.addSubview(backgroundView)
//        view.addSubview(headerView)
//        view.addSubview(statsStackView)
//        view.addSubview(hourlyForecastLabel)
//        view.addSubview(hourlyCollectionView)
//        view.addSubview(dailyForecastLabel)
//        view.addSubview(dailyForecastTableView)
        
        contentView.addSubview(headerView)
        contentView.addSubview(statsStackView)
        contentView.addSubview(hourlyForecastLabel)
        contentView.addSubview(hourlyCollectionView)
        contentView.addSubview(dailyForecastLabel)
        contentView.addSubview(dailyForecastTableView)
        contentView.addSubview(descriptionLabel)
        
        headerView.addSubview(cityLabel)
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(weatherIcon)
        
        humidityStackView.addArrangedSubview(humidityLabel)
        humidityStackView.addArrangedSubview(humidityValueLabel)
        
        loaderView.addSubview(loader)
    }
    
    private func setConstraints() {
        //background
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            
            backgroundView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            
            backgroundView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            
            backgroundView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
        ])
        
        //headerView
        /*NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60
            ),
            
            headerView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 35
            ),
            
            headerView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -35
            ),
            
            headerView.heightAnchor.constraint(equalToConstant: 150)
        ])*/
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(
                equalTo: contentView.topAnchor, constant: 60
            ),
            
            headerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 35
            ),
            
            headerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -35
            ),
            
            headerView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        //headerView -> cityLabel
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(
                equalTo: headerView.topAnchor, constant: 15
            ),
            
            cityLabel.leadingAnchor.constraint(
                equalTo: headerView.leadingAnchor, constant: 15
            ),
            
            cityLabel.trailingAnchor.constraint(
                equalTo: headerView.trailingAnchor, constant: -15
            ),
            
            cityLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        //headerView -> temperatureLabel
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(
                equalTo: cityLabel.bottomAnchor, constant: 12
            ),
            
            temperatureLabel.leadingAnchor.constraint(
                equalTo: headerView.leadingAnchor, constant: 26
            ),
        ])
        
        //headerView -> weatherIcon
        NSLayoutConstraint.activate([
            weatherIcon.widthAnchor.constraint(equalToConstant: 86),
            
            weatherIcon.heightAnchor.constraint(equalToConstant: 86),
            
            weatherIcon.trailingAnchor.constraint(
                equalTo: headerView.trailingAnchor, constant: -26
            ),
            
            weatherIcon.centerYAnchor.constraint(equalTo: temperatureLabel.centerYAnchor),
            
            weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 8)
        ])
        
        //humidityStackView
        NSLayoutConstraint.activate([
            statsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            
            statsStackView.widthAnchor.constraint(equalToConstant: 206),
            
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        /*
        //mark precarregar sem ativar as constraints
        let constraint = weatherIcon.leadingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: 8)
        constraint.isActive = false // true
        */
        
        //hourlyForecastLabel
        /*NSLayoutConstraint.activate([
            hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 29),
            
            hourlyForecastLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 35
            ),
            
            hourlyForecastLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -35
            ),
        ])*/
        NSLayoutConstraint.activate([
            hourlyForecastLabel.topAnchor.constraint(equalTo: statsStackView.bottomAnchor, constant: 29),
            
            hourlyForecastLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 35
            ),
            
            hourlyForecastLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -35
            ),
        ])
        
        //hourlyForecastLabel
        /*NSLayoutConstraint.activate([
            hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 22),
            
            hourlyCollectionView.heightAnchor.constraint(equalToConstant: 84),
            
            hourlyCollectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            
            hourlyCollectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
        ])*/
        NSLayoutConstraint.activate([
            hourlyCollectionView.topAnchor.constraint(equalTo: hourlyForecastLabel.bottomAnchor, constant: 22),
            
            hourlyCollectionView.heightAnchor.constraint(equalToConstant: 84),
            
            hourlyCollectionView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            
            hourlyCollectionView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
        ])
        
        //dailyForecastLabel
        /*NSLayoutConstraint.activate([
            dailyForecastLabel.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 29),
            
            dailyForecastLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 35
            ),
            
            dailyForecastLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -35
            ),
        ])*/
        NSLayoutConstraint.activate([
            dailyForecastLabel.topAnchor.constraint(equalTo: hourlyCollectionView.bottomAnchor, constant: 29),
            
            dailyForecastLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 35
            ),
            
            dailyForecastLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -35
            ),
        ])
        
        //dailyForecastLabel
        /*NSLayoutConstraint.activate([
            dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor, constant: 16),
            
            dailyForecastTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            dailyForecastTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            dailyForecastTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])*/
//        NSLayoutConstraint.activate([
//            dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor, constant: 16),
//            
//            dailyForecastTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            
//            dailyForecastTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            
//            dailyForecastTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//        ])
        
        NSLayoutConstraint.activate([
            dailyForecastTableView.topAnchor.constraint(equalTo: dailyForecastLabel.bottomAnchor, constant: 16),
            
            dailyForecastTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            dailyForecastTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
//            dailyForecastTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
          descriptionLabel.topAnchor.constraint(equalTo: dailyForecastTableView.bottomAnchor, constant: 20),
          descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
          descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
          descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func showLoader() {
        loaderView.isHidden = false
        loader.startAnimating()
    }
    
    private func hideLoader() {
        loaderView.isHidden = true
        loader.stopAnimating()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forecastResponse?.hourly.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier, for: indexPath) as? HourlyCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let forecast = forecastResponse?.hourly[indexPath.row]
        cell.loadData(time: forecast?.dt.toHourFormat(),
                      icon: UIImage(named: forecast?.weather.first?.icon ?? ""),
                      temp: forecast?.temp.toCelsius())
        return cell
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath)
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecastResponse?.daily.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath) as? DailyForecastTableViewCell
        else {
            return UITableViewCell()
        }
        
        let forecast = forecastResponse?.daily[indexPath.row]
        cell.loadData(weekDay: forecast?.dt.toWeekdayName().uppercased(),
                      min: forecast?.temp.min.toCelsius(),
                      max: forecast?.temp.max.toCelsius(),
                      icon: UIImage(named: forecast?.weather.first?.icon ?? ""))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
