//
//  Rank.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import Foundation

struct Record: Identifiable, Codable {
    var id: UUID = UUID()
    let num: Int
    let date: String
}
