//
//  ItemListComponentView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct ItemRowComponentView: View {
    
    let item: Item
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5, content: {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack {
                    Text("\(NSString(format: "%.2f", item.price)) \(item.currency)")
                        .font(.caption)
                    .foregroundColor(.secondary)
                    Spacer()
                    Text("\(item.deadline)")
                        .font(.caption)
                    .foregroundColor(.secondary)
                }
            })
            Spacer()
            Button(action: {
                print("hi!") // paid action
            }) {
                Image(systemName: "checkmark.circle.fill")
            }.padding()
        }
    }
}

struct ItemListComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowComponentView(item: Item(id: 1, name: "Testowy produkt w koszyku", price: 1222.22, currency: "PLN", deadline: "10/05/2022") )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
