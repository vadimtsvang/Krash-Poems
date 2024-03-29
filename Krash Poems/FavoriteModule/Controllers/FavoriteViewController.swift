//
//  FavoriteViewController.swift
//  Krash Poems
//
//  Created by Vadim on 09.01.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "AK")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Избранное"
        label.font = .montserratBoldItalic34()
        label.toAutoLayout()
        return label
    }()
    
    private let favoriteCollectionView = FavoriteCollectionView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        favoriteCollectionView.set(poems: PoemsService.shared.likedPoems)
        favoriteCollectionView.reloadData()
    }
    
    private func setupViews() {
        favoriteCollectionView.favoriteDelegate = self
        
        view.backgroundColor = .white
        view.addSubviews(titleImageView, titleLabel, favoriteCollectionView)
    }
}

extension FavoriteViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            favoriteCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            favoriteCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FavoriteViewController: FavoriteCollectionViewProtocol {
    func goTo(poem: Poem) {
        let detailsViewController = DetailsViewController()
        detailsViewController.set(poem: poem)
        present(detailsViewController, animated: true)
    }
    
    func deleteFavourite(tag: Int) {
        let likedPoems = PoemsService.shared.likedPoems
        if let poem = likedPoems.first(where: { $0.tag == tag } ) {
            PoemsService.shared.remove(tag: poem.tag)
        } else {
            return
        }
    }
}
