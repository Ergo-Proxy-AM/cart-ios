//
//  ContentView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingSettings: Bool = false
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.deadline, ascending: false)]) var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tasks, id: \.self) { task in
                    ItemRowComponentView(task: task)
                }
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
