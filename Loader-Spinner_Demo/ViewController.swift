//
//  ViewController.swift
//  Loader-Spinner_Demo
//
//  Created by Hamja Paldiwala on 10/01/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        let button = UIButton(type: .system)
        button.setTitle("Show Loader", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(showLoader), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 120),
        ])
    }

    @objc func showLoader() {
        let loaderView = CustomLoaderView(frame: view.bounds, color: .white, message: "Loading...")
        view.addSubview(loaderView)
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 3)
            DispatchQueue.main.async {
                loaderView.stopAnimating()
            }
        }
    }
}

