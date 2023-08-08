//
//  SecondViewModel.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import Foundation

class SecondViewModel: ObservableObject {

    @Published var records: [Record] = []
    
    func fetchRecords() {
        records = UserDefaultsData.shared.getRecord()
    }
}
