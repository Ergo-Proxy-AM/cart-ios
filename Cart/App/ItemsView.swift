//
//  ItemsView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ItemsView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State(initialValue: 1) var tabSelection: Int
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.createdAt, ascending: false)]) var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tasks, id: \.self) { task in
                    NavigationLink(destination: AddNewView(tabSelection: $tabSelection, editTask: task)
                    ) {
                        ItemRowComponentView(task: task)
                            .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
    }
    
    
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            managedObjectContext.delete(task)
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
