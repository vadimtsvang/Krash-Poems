//
//  FavoriteCollectionView.swift
//  Krash Poems
//
//  Created by Vadim on 11.01.2023.
//

import UIKit
//
protocol FavoriteCollectionViewProtocol: AnyObject {
    func goTo(poem: Poem)
    func deleteFavourite(tag: Int)
}

class FavoriteCollectionView: UICollectionView {
    
    private var poems = [Poem]()
    
    weak var favoriteDelegate: FavoriteCollectionViewProtocol?
    
    private let collectionLayot = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayot)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(poems: [Poem]) {
        self.poems = poems
    }
    
    private func configure() {
        collectionLayot.scrollDirection = .vertical
        backgroundColor = .none
        toAutoLayout()
        
        dataSource = self
        delegate = self
        register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.idMainCell)
    }
}

// MARK: - UICollectionViewDataSource

extension FavoriteCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        poems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.idMainCell, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        let poemModel = poems[indexPath.row]
        cell.configure(poem: poemModel)
        cell.didTap = { [weak self] tag in
            self?.favoriteDelegate?.deleteFavourite(tag: tag)
        }
//        let poem = poems[indexPath.row]
//        cell.configure(poem: poem)
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension FavoriteCollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        favoriteDelegate?.goTo(poem: poems[indexPath.row])
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension FavoriteCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 1.1, height: collectionView.frame.height / 10)
    }
}
