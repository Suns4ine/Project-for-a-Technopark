//
//  BundleExtension.swift
//  Technopark Project
//
//  Created by Vyacheslav Pronin on 22.05.2021.
//

import Foundation
import UIKit

extension Bundle {
    static func appName() -> String {
        guard let dictionary = Bundle.main.infoDictionary else {
            return ""
        }
        if let version : String = dictionary["CFBundleName"] as? String {
            return version
        } else {
            return ""
        }
    }
}
