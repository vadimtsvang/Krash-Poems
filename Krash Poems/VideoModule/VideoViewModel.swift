//
//  VideoViewModel.swift
//  Krash Poems
//
//  Created by Vadim on 11.05.2023.
//

import UIKit

final class VideoViewModel {

    var videoArray: [(title: String, url: String)] = []

    init() {
        appendVideo()
    }

    func appendVideo() {
        videoArray.removeAll()
        videoArray.append((title: "1",
                           url: ""))
        videoArray.append((title: "2",
                           url: ""))
        videoArray.append((title: "3",
                           url: ""))
        videoArray.append((title: "4",
                           url: ""))
        videoArray.append((title: "5",
                           url: ""))
        videoArray.append((title: "6",
                           url: ""))
        videoArray.append((title: "7",
                           url: ""))
        videoArray.append((title: "8",
                           url: ""))
        videoArray.append((title: "9",
                           url: ""))
        videoArray.append((title: "10",
                           url: ""))
    }
}
