//
//  PoemsService.swift
//  Krash Poems
//
//  Created by Vadim on 15.02.2023.
//

import Foundation

final class PoemsService {
    
    static let shared = PoemsService()

    var allPoems = [Poem]()
    
    var likedPoems: [Poem] {
        makeLikedPoems()
    }
    
    private let defaults = UserDefaultsService(defaults: UserDefaults.standard)
    
    func save(tag: Int) {
        if let data = defaults.get(key: .tags), var tags = try? JSONDecoder().decode([Int].self, from: data) {
            tags.append(tag)
            saveToDefaults(tags: tags)
        } else {
            saveToDefaults(tags: [tag])
        }
    }
    
    func remove(tag: Int) {
        if let data = defaults.get(key: .tags), var tags = try? JSONDecoder().decode([Int].self, from: data) {
            tags = tags.filter { $0 != tag }
            saveToDefaults(tags: tags)
        }
    }
    
    private func saveToDefaults(tags: [Int]) {
        let data = try? JSONEncoder().encode(tags)
        defaults.set(key: .tags, value: data)
    }
    
    private func makeLikedPoems() -> [Poem] {
        var likedPoems = [Poem]()
        
        if let data = defaults.get(key: .tags) {
            let tags = try? JSONDecoder().decode([Int].self, from: data)
            
            tags?.forEach { tag in
                if let poem = allPoems.first(where: { $0.tag == tag }) {
                    likedPoems.append(poem)
                }
            }
        }
        return likedPoems
    }
}

protocol UserDefaultsServiceProtocol: AnyObject {
   
    func get<T>(key: DefaultsKey<T>) -> T?
    func set<T>(key: DefaultsKey<T>, value: T?)
}

class UserDefaultsService: UserDefaultsServiceProtocol {
   
    private var defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    func get<T>(key: DefaultsKey<T>) -> T? {
        defaults.object(forKey: key.value) as? T
    }
    
    func set<T>(key: DefaultsKey<T>, value: T?) {
        defaults.set(value, forKey: key.value)
    }
}

class DefaultsKeys {
    static let tags = DefaultsKey<Data>(value: "tags")
}

class DefaultsKey<T>: DefaultsKeys {
    
    let value: String
    
    init(value: String) {
        self.value = value
    }
}
