//
//  Word.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 23.05.2021.
//

import Foundation

enum PartOfSpeech: String {
    case noun = "Существительное"
    case verb = "Глагол"
    case adjective = "Прилагательное"
    case pronoun = "Местоимение"
    case numerals = "Числительные"
    case adverb = "Наречие"
    case none = ""
}

struct Word {
    var name: String
    var translation: String
//    var anotherTranslation: [String]?
//    var partOfSpeech: PartOfSpeech?
//    var examples: [String : String]?
//    var otherMeanings: [String]?
}
