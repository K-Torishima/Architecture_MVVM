//
//  SettingView.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import SwiftUI

// https://ios-docs.dev/swiftui-list/
struct SettingView: View {
    
    enum ActionEvent {
        case cell1
        case cell2
        case cell3
    }
    
    var handler: ((_ event: ActionEvent) -> ())?
    
    mutating func set(handler: @escaping (_ event: ActionEvent) -> ()) {
        self.handler = handler
    }
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text("SettingView")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    print("tap cell1")
                    handler?(.cell1)
                }
                Text("SettingView")
                    .onTapGesture {
                        
                    }
                Text("SettingView")
                    .onTapGesture {
                      
                    }
                
            }
            
            Section(header: Text("section2")) {
                Text("SettingView")
                Text("SettingView")
                Text("SettingView")
            }
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(handler: nil)
    }
}
