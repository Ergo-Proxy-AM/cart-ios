//
//  ItemListComponentView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ItemRowComponentView: View {
    
    @ObservedObject var task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5, content: {
                Text(task.name!)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack {
                    Text("\(NSString(format: "%.2f", task.price)) \(task.currency!)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(task.deadline!, style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(task.deadline!, style: .time)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            })
            Spacer()
            Button(action: {
                print("\(task.currency)") // paid action
            }) {
                Image(systemName: "checkmark.circle.fill")
            }.padding()
        }
    }
}

struct ItemListComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowComponentView(task: Task() )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
