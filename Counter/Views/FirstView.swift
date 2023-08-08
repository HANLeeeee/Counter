//
//  FirstView.swift
//  Counter
//
//  Created by 최하늘 on 2023/07/30.
//

import SwiftUI

struct FirstView: View {
    @ObservedObject var viewModel = FirstViewModel()
    let title: String
    @State var isResetAlertShowing: Bool = false
    @State var isSaveAlertShowing: Bool = false

    var body: some View {
        VStack {
            Button {
                viewModel.updateNum()
                
            } label: {
                Text("\(viewModel.num)")
                    .font(.system(size: viewModel.fontSize, weight: .heavy))
                    .foregroundColor(.black)
            } //Button
            
        } //VStack
        .navigationTitle(title)
        .onAppear {
            viewModel.reset()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button {
                    guard viewModel.num != 0 else {
                        return
                    }
                    isSaveAlertShowing = true
                } label: {
                    Text("저장")
                }
                .alert(isPresented: $isSaveAlertShowing) {
                    let saveButton = Alert.Button.destructive(
                        Text("저장")
                    ) {
                        viewModel.save()
                    }

                    let cancelButton = Alert.Button.cancel(Text("취소"))

                    return Alert(title: Text("저장"),
                          message: Text("기록을 저장 하시겠습니까 ?"),
                          primaryButton: saveButton,
                          secondaryButton: cancelButton)

                }
                
            }) //ToolbarItem
            
            ToolbarItem(placement: .navigationBarLeading, content: {
                Button {
                    isResetAlertShowing = true
                } label: {
                    Text("초기화")
                }
                .alert(isPresented: $isResetAlertShowing) {
                    let removeButton = Alert.Button.destructive(
                        Text("초기화")
                    ) {
                        viewModel.reset()
                    }
                    
                    let cancelButton = Alert.Button.cancel(Text("취소"))
                    
                    return Alert(title: Text("초기화"),
                          message: Text("기록을 초기화 하시겠습니까 ?"),
                          primaryButton: removeButton,
                          secondaryButton: cancelButton)
                    
                }
                
            }) //ToolbarItem
        } //toolbar
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FirstView(title: TabName.first.rawValue)
        }
    }
}
