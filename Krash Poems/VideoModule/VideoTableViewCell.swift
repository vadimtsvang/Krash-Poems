//
//  VideoTableViewCell.swift
//  Krash Poems
//
//  Created by Vadim on 11.05.2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    var url: String?
    var name: String = "" {
        didSet {
            titleVideo.text = name
        }
    }
    
    lazy var titleVideo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleVideo)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    func configVideo(name: String, url: String) {
        self.name = name
        self.url = url
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension VideoTableViewCell {

    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleVideo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleVideo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleVideo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
