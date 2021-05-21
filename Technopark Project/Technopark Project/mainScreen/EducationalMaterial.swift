//
//  EducationalMaterial.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 21.05.2021.
//

import Foundation
import UIKit

enum EducationalMaterial {
    case vocabulary(Vocabulary)
    case exercises(Exercises)
}

struct EducationalMaterialModel {
    var image: UIImage?
    var title: String
    var material: [EducationalMaterial]
}

extension Array {
    func newArrayEducation(ar: [Vocabulary]) -> [EducationalMaterial] {
        var newArr = [EducationalMaterial]()
        
        for element in ar {
            newArr.append(.vocabulary(element))
        }
        
        return newArr
    }
}
