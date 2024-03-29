//
//  ContentView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var isShowingSettings: Bool = false
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.deadline, ascending: false)]) var tasks: FetchedResults<Task>
    
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name = %@", "budget")) var appSetting: FetchedResults<AppSettings>
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tasks, id: \.self) { task in
                    ItemRowComponentView(task: task)
                }
            }
            .navigationTitle("\(appSetting.first?.content ?? "") PLN")
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
