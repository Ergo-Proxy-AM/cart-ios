//
//  MainView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var tabSelection: Int = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
                .tag(1)
                .environment(\.managedObjectContext, self.managedObjectContext)
            AddNewView(tabSelection: $tabSelection, editTask: nil)
                .tabItem {
                    Image(systemName: "plus.square")
                    Text("Add")
                }
                .tag(2)
                .environment(\.managedObjectContext, self.managedObjectContext)
            ItemsView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Items")
                }.tag(3)
                .environment(\.managedObjectContext, self.managedObjectContext)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
