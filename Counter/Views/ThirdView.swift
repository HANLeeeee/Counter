//
//  ThirdView.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import SwiftUI

struct ThirdView: View {
    
    let title: String
    
    var body: some View {
        VStack {
            Image("sky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 250, height: 250)
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .padding(.top, 50)
            
            List {
                NavigationLink {
                    Text("도와드릴게 없어요")
                } label: {
                    Text("도움말")
                }

                
                NavigationLink {
                    Text("안녕하세용~ 이거 제가 만들었어여~")
                } label: {
                    Text("만든사람 소개")
                }
            }
            .listStyle(.inset)
            
        } //VStack
        .navigationTitle(title)
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ThirdView(title: TabName.third.rawValue)
        }
    }
}
