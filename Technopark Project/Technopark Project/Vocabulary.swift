//
//  Vocabulary.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 20.05.2021.
//

import Foundation

struct Vocabulary {
    var name: String
    var progress: Int
    var succses: Bool
    var words: [Word]
//    var learnedWords: [Word]
//    var misspelledWords: [Word]
//    let dateCreate: Date
//    var dateOfChange: Date
//    var numberOfAttempts: Int
}

var myVocabularies: [Vocabulary] = [.init(name: "Лес", progress: 56, succses: false, words: []),
                                    .init(name: "Реки", progress: 100, succses: false, words: []),
                                    .init(name: "Животные", progress: 56, succses: false, words: []),
                                    .init(name: "Птицы", progress: 10, succses: false, words: [])]
