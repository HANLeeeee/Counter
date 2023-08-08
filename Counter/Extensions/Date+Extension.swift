//
//  Date+Extension.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM dd yyyy, HH:mma"
//        formatter.locale = Locale(identifier: "ko")
        let str = formatter.string(from: self)
        return str
    }
}
