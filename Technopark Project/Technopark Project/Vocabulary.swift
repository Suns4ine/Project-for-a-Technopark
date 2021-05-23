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
    var learnedWords: [Word]
    var misspelledWords: [Word]
    let dateCreate: Date
    var dateOfChange: Date
    var numberOfAttempts: Int
}
