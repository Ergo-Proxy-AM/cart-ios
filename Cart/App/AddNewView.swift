//
//  AddNewView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct AddNewView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @State private var name: String = ""
    @State private var price: Float = 0
    @State private var currency: String = ""
    @State private var deadline: Date = Date()

    let currencies: [Currency] = Bundle.main.decode("currencies.json")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Form {
                TextField("Name", text: $name)
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(9)
                    .font(.system(size: 24, weight: .bold, design: .default))
                TextField("Price", value: $price, format: .number)
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(9)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .keyboardType(.decimalPad)
                Picker("Currency", selection: $currency) {
                    ForEach(currencies) { currency in
                        Text(currency.label)
                    }
                }.pickerStyle(WheelPickerStyle())
                
                DatePicker("Deadline", selection: $deadline)
                    .datePickerStyle(WheelDatePickerStyle())
            }
            
            
            Button(action: {
                let task = Task(context: self.managedObjectContext)
                task.name = self.name
                task.price = self.price
                task.currency = self.currency
                task.deadline = self.deadline
                
                do {
                  try self.managedObjectContext.save()
                  // print("New todo: \(todo.name ?? ""), Priority: \(todo.priority ?? "")")
                } catch {
                  print(error)
                }
            }, label: {
                Text("save")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding()
            })
        }
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewView()
    }
}
