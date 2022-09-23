//
//  AddNewView.swift
//  Cart
//
//  Created by Axel Mitura on 22/05/2022.
//

import SwiftUI

struct AddNewView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var price: Float = 0
    @State private var currency: String = "PLN"
    @State private var deadline: Date = Date()
    @State private var createdAt: Date = Date()
    
    @Binding var tabSelection: Int
    
    var editTask: Task?
    let currencies: [Currency] = Bundle.main.decode("currencies.json")
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Form {
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    TextField("Price", value: $price, format: .currency(code: currency))
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .keyboardType(.decimalPad)
                    Picker("Currency", selection: $currency) {
                        ForEach(currencies) { currency in
                            Text(currency.label).tag(currency.label)
                        }
                    }
                    
                    DatePicker("Deadline", selection: $deadline)
                        .onAppear() {
                            if (editTask != nil) {
                                self.name = editTask!.name!
                                self.price = editTask!.price
                                self.currency = editTask!.currency!
                                self.deadline = editTask!.deadline!
                                self.createdAt = editTask!.createdAt!
                            }
                        }
                }
                
                
                Button(action: {
                    let task = editTask ?? Task(context: self.managedObjectContext)
                    task.name = self.name
                    task.price = self.price
                    task.currency = self.currency
                    task.deadline = self.deadline
                    task.createdAt = self.createdAt
                    
                    do {
                        try self.managedObjectContext.save()
                        if (editTask != nil) {
                            presentationMode.wrappedValue.dismiss()
                        }
                        self.tabSelection = 3
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
            .navigationBarTitle(Text("Add new Task"), displayMode: .large)
            .navigationBarItems(trailing:
                                    Button(action: {
                if (editTask != nil) {
                    presentationMode.wrappedValue.dismiss()
                }
                self.tabSelection = 1
            }
                                          ){
                Image(systemName: "xmark")
            }
            )
        }
    }
}

struct AddNewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State(initialValue: 2) var tabSelection: Int
        
        var body: some View {
            AddNewView(tabSelection: $tabSelection, editTask: nil)
        }
    }
}
