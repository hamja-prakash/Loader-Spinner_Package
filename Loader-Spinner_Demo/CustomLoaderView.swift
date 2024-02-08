//
//  CustomLoaderView.swift
//  Loader-Spinner_Demo
//
//  Created by Hamja Paldiwala on 10/01/24.
//

import UIKit

class CustomLoaderView: UIView {
    private var activityIndicator: UIActivityIndicatorView!

    init(frame: CGRect, color: UIColor, message: String? = nil) {
        let loaderSize = CGSize(width: 120, height: 120)
        let loaderFrame = CGRect(x: (frame.width - loaderSize.width) / 2, y: (frame.height - loaderSize.height) / 2, width: loaderSize.width, height: loaderSize.height)
        super.init(frame: loaderFrame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)

        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = color
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()

        addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

        if let message = message {
            let messageLabel = UILabel()
            messageLabel.text = message
            messageLabel.textColor = UIColor.white
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(messageLabel)

            NSLayoutConstraint.activate([
                messageLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 10),
                messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func stopAnimating() {
        activityIndicator.stopAnimating()
        removeFromSuperview()
    }
}



