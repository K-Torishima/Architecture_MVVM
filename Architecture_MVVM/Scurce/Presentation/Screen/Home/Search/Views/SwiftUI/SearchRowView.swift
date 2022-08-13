//
//  SearchRowView.swift
//  Architecture_MVVM
//
//  Created by Koji Torishima on 2022/08/13.
//

import SwiftUI

struct SearchRowView: View {
    
    let data: Repository
    
    var body: some View {
        VStack {
            Text(verbatim: "\(data)")
                .font(.system(size: 12, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(12)
            .background(Color.red)
    }
}

struct SearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRowView(data: Repository(id: 44838949,
                                       nodeID: "MDEwOlJlcG9zaXRvcnk0NDgzODk0OQ==",
                                       name: "swift",
                                       fullName: "apple/swift",
                                       owner: Owner(login: "apple",
                                                    id: 10639145,
                                                    nodeID: "MDEyOk9yZ2FuaXphdGlvbjEwNjM5MTQ1",
                                                    avatarURL: URL(string:"https://avatars.githubusercontent.com/u/10639145?v=4")!,
                                                    gravatarID: "",
                                                    url: URL(string: "https://api.github.com/users/apple")!,
                                                    receivedEventsURL: URL(string: "https://api.github.com/users/apple/received_events")!,
                                                    type: "Organization"),
                                       isPrivate: false,
                                       htmlURL: URL(string: "https://github.com/apple/swift")!,
                                       contributorsURL: URL(string: "https://api.github.com/repos/apple/swift/contributors")!,
                                       description: "The Swift Programming Language",
                                       isFork: false,
                                       url: URL(string: "https://api.github.com/repos/apple/swift")!,
                                       createdAt: "2015-10-23T21:15:07Z",
                                       updatedAt: "2022-08-13T11:17:23Z",
                                       pushedAt: "2022-08-13T14:13:56Z",
                                       homepage: "https://swift.org",
                                       size: 843960,
                                       stargazersCount: 60300,
                                       watchersCount: 60300,
                                       language: "C++",
                                       forksCount: 9688,
                                       openIssuesCount: 6035,
                                       defaultBranch: "main"))
        .previewLayout(.fixed(width: 500, height: 300))
    }
}
