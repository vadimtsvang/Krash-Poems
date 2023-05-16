//
//  PlayerViewController.swift
//  Krash Poems
//
//  Created by Vadim on 11.05.2023.
//

import UIKit
import YoutubePlayer_in_WKWebView

class PlayerViewController: UIViewController {

    private var player: WKYTPlayerView = {
        let play = WKYTPlayerView()
        play.toAutoLayout()
        return play
    }()

    private var url: String

    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()

    init(url: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
        view.addSubviews(player, dismissButton)
        setup()
        player.delegate = self
        config(url: url)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func backButton() {
        self.dismiss(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func config(url: String) {
        player.load(withVideoId: url)
    }

    private func setup() {
        view.addSubviews(player, dismissButton)

        NSLayoutConstraint.activate([

            player.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            player.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            player.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            player.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),

            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

extension PlayerViewController: WKYTPlayerViewDelegate {

    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
    }
}
