//
//  SecondView.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import SwiftUI

struct SecondView: View {
    @ObservedObject var viewModel = SecondViewModel()
    let title: String
    @State var isAlertShowing: Bool = false

    var body: some View {
        List(viewModel.records) { record in
            
            VStack(alignment: .leading) {
                Text("\(record.num)")
                    .font(.system(size: 32, weight: .semibold))
                    .padding([.top, .bottom], 5)
                Text("\(record.date)")
                    .foregroundColor(.secondary)
            }
            .padding([.leading, .trailing], 5)
            
        } //List
        .navigationTitle(title)
        .onAppear {
            viewModel.fetchRecords()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button {
                    isAlertShowing = true
                } label: {
                    Text("기록 지우기")
                }
                .alert(isPresented: $isAlertShowing) {
                    let removeButton = Alert.Button.destructive(
                        Text("삭제")
                    ) {
                        UserDefaultsData.shared.removeRecords()
                        viewModel.fetchRecords()
                    }
                    
                    let cancelButton = Alert.Button.cancel(Text("취소"))
                    
                    return Alert(title: Text("삭제"),
                          message: Text("기록을 전부 삭제하시겠습니까 ?"),
                          primaryButton: removeButton,
                          secondaryButton: cancelButton)
                    
                }
                
            }) //ToolbarItem
        } //toolbar
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SecondView(title: TabName.second.rawValue)
        }
    }
}
