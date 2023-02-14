//
//  MainCollectionViewCell.swift
//  KrashPoems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.toAutoLayout()
        return label
    }()
    
    private let poemLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Roboto-Medium", size: 12)
        label.textColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .darkGray
        return view
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart.circle"), for: .normal)
        button.setImage(UIImage(systemName: "heart.circle.fill"), for: .selected)
        button.addTarget(self, action: #selector(self.didTapFavoriteButton), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    static let idMainCell = "idMainCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        backgroundColor = .clear
        tintColor = .black
        addSubviews(nameLabel, poemLabel, lineView, favoriteButton)
    }
            
    func configure(poem: Poem) {
        nameLabel.text = poem.poemName
        poemLabel.text = poem.fullPoem
    }
    
    @objc private func didTapFavoriteButton() {
//        let imageName = self.detailsModel.isFavorite == false ? "heart.circle.fill" : "heart.circle"
//        UIView.animate(withDuration: 0.2) {
//            self.favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
//            //self.favoriteButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//        } completion: { _ in
//            guard var newViewModel = self.viewModel else { return }
////
//            UIView.animate(withDuration: 0.2) {
//                self.favoriteButton.transform = .identity
//            } completion: { _ in
//                newViewModel.isFavorite.toggle()
//                self.viewModel = newViewModel
//                self.delegate?.wasLikedArticle(with: self.tag)
//            }
//        }
    }
}

extension MainCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            poemLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            poemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            poemLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            lineView.topAnchor.constraint(equalTo: poemLabel.bottomAnchor, constant: 5),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            favoriteButton.bottomAnchor.constraint(equalTo: lineView.bottomAnchor, constant: -20),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
