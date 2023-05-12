//
//  VideoViewController.swift
//  Krash Poems
//
//  Created by Vadim on 11.05.2023.
//

import UIKit

class VideoViewController: UIViewController {
    
    //private let coordinator: VideoCoordinator?
    private var viewModel: VideoViewModel? = nil
    
    lazy var videoTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    init(viewModel: VideoViewModel?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTableView.delegate = self
        videoTableView.dataSource = self
        videoTableView.register(VideoTableViewCell.self,
                                forCellReuseIdentifier: String(describing: VideoTableViewCell.self))
        view.addSubview(videoTableView)
        setConstraints()

    }
}

extension VideoViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            videoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            videoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            videoTableView.topAnchor.constraint(equalTo: view.topAnchor),
            videoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension VideoViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (viewModel?.videoArray.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = videoTableView.dequeueReusableCell(withIdentifier: String(describing: VideoTableViewCell.self), for: indexPath) as? VideoTableViewCell
        guard cell != nil,
              let viewModel = viewModel?.videoArray else { return UITableViewCell() }
        cell?.configVideo(name: viewModel[indexPath.row].title, url: viewModel[indexPath.row].url)
        return cell!
    }
}

extension VideoViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return "My Video"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        tableView.deselectRow(at: indexPath, animated: false)
        let player = PlayerViewController(url: viewModel.videoArray[indexPath.row].url)
        present(player, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
