//
//  ContentView.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import SwiftUI

enum TabName: String {
    case first = "Counter"
    case second = "Record"
    case third = "Info"
}

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                FirstView(title: TabName.first.rawValue)
            }
            .tabItem {
                Image(systemName: "plus.circle")
                Text(TabName.first.rawValue)
            }
            
            NavigationStack {
                SecondView(title: TabName.second.rawValue)
            }
            .tabItem {
                Image(systemName: "trophy.circle")
                Text(TabName.second.rawValue)
            }
            
            NavigationStack {
                ThirdView(title: TabName.third.rawValue)
            }
            .tabItem {
                Image(systemName: "info.circle")
                Text(TabName.third.rawValue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
