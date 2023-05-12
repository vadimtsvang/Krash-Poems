//
//  MainTabBarController.swift
//  Krash Poems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
        setupItems()
    }

    private func setupTabBar() {
        tabBar.backgroundColor = .lightGray
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let favoritesVC = FavoriteViewController()
        let videoVC = VideoViewController(viewModel: VideoViewModel())
        let infoVC = InfoViewController()
        
        setViewControllers([mainVC, favoritesVC, videoVC, infoVC], animated: true)
        
        guard let items = tabBar.items else { return }
        
        items[0].title = "Poems"
        items[1].title = "Favorites"
        items[2].title = "Video Poems"
        items[3].title = "Info"
        
        items[0].image = UIImage(systemName: "pencil.circle")
        items[1].image = UIImage(systemName: "heart.circle")
        items[2].image = UIImage(systemName: "video.circle")
        items[3].image = UIImage(systemName: "person.circle")
    }
}
