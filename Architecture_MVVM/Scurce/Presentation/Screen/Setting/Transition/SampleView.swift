//
//  SampleView.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/15.
//

import SwiftUI

struct SampleView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView(text: "sample")
    }
}
