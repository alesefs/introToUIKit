//
//  ViewControllerExample.swift
//  introToUIKit
//
//  Created by Alessandro Emanuel Ferreira de Souza on 25/05/24.
//

import Foundation
import UIKit

class ViewControllerExample: UIViewController {

//MARK: lateinit var no android
    private lazy var customView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //sempre que aparece a tela
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //antes do did Appear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    private func setupView() {
//        let customView = UIView(frame: .zero)
//        customView.backgroundColor = .black
//        customView.translatesAutoresizingMaskIntoConstraints = false
        
        setHierachy()
        setConstraints()
    }
    
    private func setHierachy() {
        view.addSubview(customView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 100
            ),
            
            customView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 50
            ),
            
            customView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -50
            ),
            
            customView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -100
            ),
        ])
    }
}
