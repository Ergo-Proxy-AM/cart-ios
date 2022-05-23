//
//  MainView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            AddNewView(item: Item(id: 1, name: "Testowy produkt w koszyku", price: 1222.22, currency: "PLN", deadline: "10/05/2022"))
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("Add")
                }
            ItemsView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Items")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
