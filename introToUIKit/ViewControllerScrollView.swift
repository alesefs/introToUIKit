//
//  ViewControllerScrollView.swift
//  introToUIKit
//
//  Created by Alessandro Emanuel Ferreira de Souza on 27/05/24.
//

import Foundation
import UIKit

class ViewControllerScrollView: UIViewController {
  
  // setting up a scroll view
  // 1. add scrollview
  // 2. add content view
  // 3. add subviews to content view
  // Note: must set high priority of content view to low, default is 1000
  
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
  
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "photo")
        iv.clipsToBounds = true
        return iv
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        label.font = UIFont.preferredFont(forTextStyle: .title1) // title1, larger, title2 medium, title3 smaller
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
  
    private func commonInit() {
        setupScrollViewContstraints()
        setupContentViewConstraints()
        setupItemImageViewConstraints()
        setupDescriptionLabelConstraints()
    }
  
    private func setupScrollViewContstraints() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
  
  private func setupContentViewConstraints() {
    scrollView.addSubview(contentView)
    
    let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
    heightConstraint.priority = UILayoutPriority(250)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      heightConstraint,
    ])
  }
  
  private func setupItemImageViewConstraints() {
    contentView.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.50)
    ])
  }
  
  private func setupDescriptionLabelConstraints() {
    contentView.addSubview(descriptionLabel)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
      descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
    ])
  }
}
