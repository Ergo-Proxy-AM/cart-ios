//
//  ItemsView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ItemsView: View {
//    let tasks: [Task] = Bundle.main.decode("items.json")

    var body: some View {
        NavigationView {
            List {
//                ForEach(tasks) { task in
//                    NavigationLink(destination: AddNewView(task: task)) {
//                        ItemRowComponentView(task: task)
//                                .padding(.vertical, 4)
//                    }
//                }
            }
        }
    }
}

struct ItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView()
    }
}
