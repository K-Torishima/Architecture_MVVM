//
//  DetailView.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/14.
//

import SwiftUI

/*
 簡単なData表示ならこんなもんで表示できるが
 ボタン持っていて、ActionをViewControllerに渡すときとかは要検討しなければならない
 
 
 */
struct DetailView: View {
    
    var data: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            OwnerIconView(url: "\(data.owner.avatarURL)")
                .frame(width: 150, height: 150)
            DetailLabelView(itemLabel: "FullName", 30, .bold, valueLabel: data.fullName, 24, .medium)
            DetailLabelView(itemLabel: "Owner", valueLabel: data.owner.login)
            DetailLabelView(itemLabel: "Description", valueLabel: data.description ?? "")
            DetailLabelView(itemLabel: "CreatedAt", valueLabel: data.createdAt)
            DetailLabelView(itemLabel: "Homepage", valueLabel: data.homepage ?? "")
            DetailLabelView(itemLabel: "StarCount", valueLabel: "\(data.stargazersCount)")
            DetailLabelView(itemLabel: "Language", valueLabel: data.language ?? "")
        }
        .frame(maxWidth: .infinity,  alignment: .leading)
        .padding(20)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(data: Repository.mock())
            .previewLayout(.fixed(width: 500, height: 800))
    }
}
