//
//  Poems.swift
//  KrashPoems
//
//  Created by Vadim on 16.11.2022.
//

import Foundation

struct Poems: Decodable {
    let success: Bool
    let poems: [Poem]
}

struct Poem: Decodable {
    var poemName: String
    var fullPoem: String
    var tag: Int
}
