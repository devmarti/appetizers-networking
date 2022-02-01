//
//  AppData.swift
//  Appetizers
//
//  Created by APPS2T on 27/1/22.
//

import Foundation

class AppData {
    static let shared = AppData()
    private init() {}
    var order: [Appetizer] = []
}
