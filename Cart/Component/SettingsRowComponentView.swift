//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Axel Mitura on 28/03/2021.
//

import SwiftUI

struct SettingsRowComponentView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestenation: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestenation != nil) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestenation!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct SettingsRowComponentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowComponentView(name: "Developer", content: "Axel Mitura")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowComponentView(name: "Website", linkLabel: "Ergo Proxy", linkDestenation: "ergoproxy.pl")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
