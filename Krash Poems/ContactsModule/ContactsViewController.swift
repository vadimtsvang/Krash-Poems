//
//  ContactsViewController.swift
//  Krash Poems
//
//  Created by Vadim on 09.01.2023.
//

import UIKit

class ContactsViewController: UIViewController {
    
//    private let titleImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.toAutoLayout()
//        imageView.image = UIImage(named: "AK")
//        return imageView
//    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 0.5
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private lazy var instagramButton: UIButton = {
        let button = UIButton()
        button.tintColor = .darkGray
        button.setTitle("Instagram", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(instButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private lazy var telegramButton: UIButton = {
        let button = UIButton()
        button.tintColor = .darkGray
        button.setTitle("Telegram", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(teleButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private lazy var whatsappButton: UIButton = {
        let button = UIButton()
        button.tintColor = .darkGray
        button.setTitle("WhatsApp", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(whatButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private lazy var vkButton: UIButton = {
        let button = UIButton()
        button.tintColor = .darkGray
        button.setTitle("VK", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(vkButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private lazy var fbButton: UIButton = {
        let button = UIButton()
        button.tintColor = .darkGray
        button.setTitle("Facebook", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(fbButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        dismissButton.layer.cornerRadius = dismissButton.frame.width / 2
    }
    
    @objc private func dismissButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func instButtonTapped() {
        if let url = URL(string: "http://www.instagram.com") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    @objc private func teleButtonTapped() {
        if let url = URL(string: "https://www.telegram.org/") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    @objc private func whatButtonTapped() {
        if let url = URL(string: "https://www.whatsapp.com/") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    @objc private func vkButtonTapped() {
        if let url = URL(string: "https://www.vk.com/") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    @objc private func fbButtonTapped() {
        if let url = URL(string: "https://www.facebook.com/") {
             UIApplication.shared.open(url, options: [:])
         }
    }
    
    private func setupViews() {
        view.backgroundColor = .gray
        view.addSubviews(dismissButton, instagramButton, telegramButton, whatsappButton, vkButton, fbButton)
    }
}

extension ContactsViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
//            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 125),
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 100),
            dismissButton.widthAnchor.constraint(equalToConstant: 100),
            
            instagramButton.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 30),
            instagramButton.heightAnchor.constraint(equalToConstant: 20),
            instagramButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            telegramButton.topAnchor.constraint(equalTo: instagramButton.bottomAnchor, constant: 40),
            telegramButton.heightAnchor.constraint(equalToConstant: 20),
            telegramButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            whatsappButton.topAnchor.constraint(equalTo: telegramButton.bottomAnchor, constant: 40),
            whatsappButton.heightAnchor.constraint(equalToConstant: 20),
            whatsappButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            vkButton.topAnchor.constraint(equalTo: whatsappButton.bottomAnchor, constant: 40),
            vkButton.heightAnchor.constraint(equalToConstant: 20),
            vkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            fbButton.topAnchor.constraint(equalTo: vkButton.bottomAnchor, constant: 40),
            fbButton.heightAnchor.constraint(equalToConstant: 20),
            fbButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
