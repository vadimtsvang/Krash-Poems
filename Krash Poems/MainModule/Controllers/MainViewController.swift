//
//  MainViewController.swift
//  Krash Poems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "AK")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Стихи"
        label.textAlignment = .center
        label.font = .montserratBoldItalic34()
        label.toAutoLayout()
        return label
    }()
    
    private var poems = [Poems]()
    private let mainCollectionView = MainCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        makeResponse { [weak self] poems in
            guard let poems = poems?.poems else { return }
            PoemsService.shared.allPoems = poems
            self?.mainCollectionView.set(poems: poems)
            self?.mainCollectionView.reloadData()
        }
    }
    
    private func setupViews() {
        mainCollectionView.mainDelegate = self
        
        view.backgroundColor = .white
        view.addSubviews(titleImageView, titleLabel, mainCollectionView)
    }
    
    func makeResponse(completion: @escaping PoemsCompletion) {
        if let path = Bundle.main.path(forResource: "poems", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let poems = try? JSONDecoder().decode(Poems.self, from: data)
                completion(poems)
            } catch {
                completion(nil)
            }
        }
    }
}

extension MainViewController {

    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            mainCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension MainViewController: MainCollectionViewProtocol {
    
    func goTo(poem: Poem) {
        let detailsViewController = DetailsViewController()
        detailsViewController.set(poem: poem)
        present(detailsViewController, animated: true)
    }
    
    func addFavourite(tag: Int) {
        let likedPoems = PoemsService.shared.likedPoems
        if let poem = likedPoems.first(where: { $0.tag == tag } ) {
            PoemsService.shared.remove(tag: poem.tag)
        } else {
            PoemsService.shared.save(tag: tag)
        }
    }
}
