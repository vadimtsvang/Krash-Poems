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
        videoArray.append((title: "Ты сама покупала себе цветы",
                           url: "RLx8eY609fo"))
        videoArray.append((title: "И на одном дыхании",
                           url: "QtZDrCTj0-4"))
        videoArray.append((title: "Удачи! Счастья Вам! Любви!",
                           url: "lCFRGRMrkK8"))
        videoArray.append((title: "Будьте, пожалуйста, ближе друг к другу",
                           url: "km3EVdDwhAM"))
        videoArray.append((title: "Ты заметила?",
                           url: "CrCf6OKCN9o"))
        videoArray.append((title: "Ну вот и кончились мои слова",
                           url: "HQI6LQ6TQmc"))
        videoArray.append((title: "Как бы хотел бы я тепла",
                           url: "kF5NoqLjYJA"))
        videoArray.append((title: "Я обещал тебе вернуться",
                           url: "-0qE5Zsz1tI"))
        videoArray.append((title: "Мы когда-нибудь сбудемся",
                           url: "e7YoBZNVLYU"))
        videoArray.append((title: "Имя",
                           url: "K1ujt4r1mwM"))
        videoArray.append((title: "Соври мне",
                           url: "lKGwKLy3Aic"))
        videoArray.append((title: "Почему?",
                           url: "EcjcRWOy8HM"))
        videoArray.append((title: "Аферист",
                           url: "2qqFRvbviZw"))
        videoArray.append((title: "Сирень",
                           url: "Vx33ZjUFAbE"))
        videoArray.append((title: "Дверь",
                           url: "WKwPev744B4"))
        videoArray.append((title: "Когда-нибудь исчезну я",
                           url: "2nCjUoF1cyI"))
        videoArray.append((title: "Это мой дом",
                           url: "7mjdoF5du5M"))
    }
}
