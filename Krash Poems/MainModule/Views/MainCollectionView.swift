//
//  MainCollectionView.swift
//  KrashPoems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

protocol MainCollectionViewProtocol: AnyObject {
    func goTo(poem: Poem)
}

class MainCollectionView: UICollectionView {
    
    weak var mainDelegate: MainCollectionViewProtocol?

    private var poems = [Poem]()
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
        toAutoLayout()
        
        dataSource = self
        delegate = self
        register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.idMainCell)
    }
}

// MARK: - UICollectionViewDataSource

extension MainCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        poems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.idMainCell, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        let poemModel = poems[indexPath.row]
        cell.configure(poem: poemModel)
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MainCollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainDelegate?.goTo(poem: poems[indexPath.row])
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 1.1,
               height: collectionView.frame.height / 10)
    }
}
