//
//  ItemsView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ItemsView: View {
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.createdAt, ascending: false)]) var tasks: FetchedResults<Task>

    var body: some View {
        NavigationView {
            List {
                ForEach(self.tasks, id: \.self) { task in
                    NavigationLink(destination: AddNewView(tabSelection: .constant(2))) {
                        ItemRowComponentView(task: task)
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
