//
//  OwnerIconView.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import SwiftUI

struct OwnerIconView: View {
    
    var url: String
    @State private var iconImage: UIImage?
    
    var body: some View {
        VStack {
            if let image = iconImage {
                Image(uiImage: image)
                    .resizable()
                    .scaleEffect()
            }
        }
        .onAppear {
            downloadImageAsync(url: URL(string: url)!) { image in
                self.iconImage = image
            }
        }
    }
}

struct OwnerIconView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerIconView(url: "https://avatars.githubusercontent.com/u/10639145?v=4")
    }
}
