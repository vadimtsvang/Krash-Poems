//
//  MainCollectionViewCell.swift
//  KrashPoems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var didTap: IntCompletion?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .montserratItalic18()
        label.toAutoLayout()
        return label
    }()
    
    private let poemLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .montserratItalic14()
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
        favoriteButton.tag = poem.tag
    }
    
    @objc private func didTapFavoriteButton() {
        didTap?(favoriteButton.tag)
        favoriteButton.setImage(UIImage(systemName: "heart.circle.fill"), for: .selected)
        //favoriteButton.reloadInputViews()
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
