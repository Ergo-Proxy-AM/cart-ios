//
//  AddNewView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct AddNewView: View {
    let item: Item
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView(item: Item(id: 1, name: "Testowy produkt w koszyku", price: 1222.22, currency: "PLN", deadline: "10/05/2022"))
    }
}
