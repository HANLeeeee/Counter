//
//  UserDefaultsData.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import Foundation

class UserDefaultsData {
    static let shared: UserDefaultsData = {
        return UserDefaultsData()
    }()
    
    var records: [Record] = [
//        Record(num: 120, date: "Monday, January 2 2022, 12:12AM"),
//        Record(num: 32, date: "Friday, March 12 2023, 03:42PM"),
    ]
    
    func removeRecords() {
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.records.rawValue)
    }
    
    func setRecord(record: Record) {
        records.insert(record, at: 0)
        
        do {
            let endcoder: JSONEncoder = JSONEncoder()
            let data: Data = try endcoder.encode(records)
            UserDefaults.standard.set(data, forKey: UserDefaultsKey.records.rawValue)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getRecord() -> [Record] {
        do {
            if let data = UserDefaults.standard.object(forKey: UserDefaultsKey.records.rawValue) as? Data {
                let decoder: JSONDecoder = JSONDecoder()
                return try decoder.decode([Record].self, from: data)
            }
            
        } catch {
            print(error.localizedDescription)
            
        }
        print("실패")
        return []
    }
}
