//
//  SettingRowView.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/15.
//

import SwiftUI

struct SettingRowView: View {
    
    var rowLabel: String
    
    var handler: (() -> ())?
    
    mutating func set(handler: @escaping () -> ()) {
        self.handler = handler
    }
    
    var body: some View {
        HStack {
            Text(rowLabel)
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            handler?()
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(rowLabel: "row 1")
    }
}
