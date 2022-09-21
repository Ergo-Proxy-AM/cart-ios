//
//  ContentView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSettings: Bool = false
    
//    let tasks: [Task] = Bundle.main.decode("items.json")

    
    var body: some View {
        NavigationView {
            List {
//                ForEach(tasks) { task in
//                    ItemRowComponentView(task: task)
//                }
            }
            .navigationTitle("{BUDGET}")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        isShowingSettings = true
                                    }) {
                                        Image(systemName: "slider.horizontal.3")
                                    }//:BUTTON
                                    .sheet(isPresented: $isShowingSettings) {
                                        SettingsView()
                                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
