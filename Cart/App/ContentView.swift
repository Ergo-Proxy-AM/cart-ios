//
//  ContentView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    let items: [Item] = Bundle.main.decode("items.json")

    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ItemRowComponentView(item: item)
                }
            }
            .navigationTitle("{BUDGET}")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
