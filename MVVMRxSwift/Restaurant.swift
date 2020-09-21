//
//  Restaurant.swift
//  MVVMRxSwift
//
//  Created by Saulo Garcia on 9/20/20.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}
