//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Axel Mitura on 28/03/2021.
//

import SwiftUI

struct SettingsLabelComponentView: View {
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelComponentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelComponentView(labelText: "Cart", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
