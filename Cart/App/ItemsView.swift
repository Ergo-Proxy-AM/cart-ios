//
//  ItemsView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ItemsView: View {
    let items: [Item] = Bundle.main.decode("items.json")

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink(destination: AddNewView(item: item)) {
                        ItemRowComponentView(item: item)
                                .padding(.vertical, 4)
                    }
                }
            }
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
