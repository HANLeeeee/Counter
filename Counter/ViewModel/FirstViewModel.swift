//
//  FirstViewModel.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import Foundation

enum UserDefaultsKey: String {
    case records
}

class FirstViewModel: ObservableObject {
    
    @Published var num: Int = 0
    @Published var fontSize: CGFloat = 300
        
    func reset() {
        num = 0
        fontSize = 300
    }
    
    func updateNum() {
        num += 1
        fontSize -= 10
    }
    
    func save() {
        let date = Date().toString()
        let record = Record(num: num, date: date)
        UserDefaultsData.shared.setRecord(record: record)
        reset()
    }
}
