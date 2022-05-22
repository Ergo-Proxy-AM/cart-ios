//
//  SettingsView.swift
//  Fructus
//
//  Created by Axel Mitura on 26/03/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    //:SECTION1
                    GroupBox(
                        label:
                            SettingsLabelComponentView(labelText: "Cart", labelImage: "info.circle")
                    ) {
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium and calories. None have chloestelor. Fruits are sources of many essentials nutrients, including potassium, dietary fiber, vitamins, and mutch more.")
                                .font(.footnote)
                        })
                    }
                    
                    //:SECTION2
                    GroupBox(label:
                        SettingsLabelComponentView(labelText: "Customization", labelImage: "paintbrush")
                        , content: {
                            Divider().padding(.vertical, 4)
                    })
                    
                    //:SECTION3
                    GroupBox(label: SettingsLabelComponentView(labelText: "Application", labelImage: "apps.iphone"), content: {
                        SettingsRowComponentView(name: "Developer", content: "Axel Mitura")
                        SettingsRowComponentView(name: "Compatibility", content: "iOS 15")
                        SettingsRowComponentView(name: "Website", linkLabel: "Ergo Proxy", linkDestenation: "ergoproxy.pl")
                        SettingsRowComponentView(name: "SwiftUI", content: "5.0")
                        SettingsRowComponentView(name: "Version", content: "1.0.0")
                    })//:BOX
                }//:VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                        ){
                                            Image(systemName: "xmark")
                                        }
                )
                .padding()
            }//:SCROLL
        }//:NAVIGATION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
