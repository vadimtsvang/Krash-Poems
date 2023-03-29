//
//  InfoViewController.swift
//  Krash Poems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "AK")
        return imageView
    }()
    
    private lazy var contactsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.setTitle("Контакты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Обо мне"
        label.font = .montserratBoldItalic34()
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .montserratItalic18()
        label.text = infoDescription
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private var transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        contactsButton.layer.cornerRadius = contactsButton.frame.width / 2
    }
    
    @objc private func presentButtonTapped() {
        let contactsVC = ContactsViewController()
        contactsVC.modalPresentationStyle = .custom
        contactsVC.transitioningDelegate = self
        present(contactsVC, animated: true)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubviews(titleLabel, titleImageView, contactsButton, descriptionLabel)
    }
}

//MARK: - UIViewControllerTransitioningDelegate

extension InfoViewController: UIViewControllerTransitioningDelegate {
 
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = contactsButton.center
        transition.circleColor = contactsButton.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = contactsButton.center
        transition.circleColor = contactsButton.backgroundColor!
        return transition
    }
}

//MARK: - Set Constraints

extension InfoViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            contactsButton.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 15),
            contactsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactsButton.heightAnchor.constraint(equalToConstant: 100),
            contactsButton.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: contactsButton.bottomAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
