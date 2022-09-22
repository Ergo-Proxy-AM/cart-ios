//
//  SettingsView.swift
//  Fructus
//
//  Created by Axel Mitura on 26/03/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name = %@", "budget")) var appSetting: FetchedResults<AppSettings>
    
    @State private var budget: Float = 0
    @State private var isSaved: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    GroupBox(
                        label:
                            SettingsLabelComponentView(labelText: "Budget", labelImage: "info.circle")
                    )  {
                        TextField("Budget", value: $budget, format: .number)
                            .padding()
                            .background(Color(UIColor.tertiarySystemFill))
                            .cornerRadius(9)
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .keyboardType(.decimalPad)
                            .onAppear() {
                                self.budget = (self.appSetting.first != nil) ? Float((self.appSetting.first?.content)!)! : 0
                            }
                        Button("Save", action: {
                            let storedBudget = appSetting.first
                            
                            if (storedBudget != nil) {
                                self.managedObjectContext.performAndWait {
                                    storedBudget?.content = "\(NSString(format: "%.2f", self.budget))"
                                }
                                } else {
                                let appSettings = AppSettings(context: self.managedObjectContext)
                                appSettings.name = "budget"
                                appSettings.content = "\(NSString(format: "%.2f", self.budget))"
                                
                                do {
                                  try self.managedObjectContext.save()
                                    
                                    self.isSaved = true
                                } catch {
                                  print(error)
                                }
                            }
                        })
                        
                    }
                    //:SECTION1
                    GroupBox(
                        label:
                            SettingsLabelComponentView(labelText: "Cart", labelImage: "info.circle")
                    ) {
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium and calories. None have chloestelor. Fruits are sources of many essentials nutrients, including potassium, dietary fiber, vitamins, and mutch more.")
                                .font(.footnote)
                        })
                    }
                    
                    //:SECTION2
                    GroupBox(label:
                        SettingsLabelComponentView(labelText: "Customization", labelImage: "paintbrush")
                        , content: {
                            Divider().padding(.vertical, 4)
                    })
                    
                    //:SECTION3
                    GroupBox(label: SettingsLabelComponentView(labelText: "Application", labelImage: "apps.iphone"), content: {
                        SettingsRowComponentView(name: "Developer", content: "Axel Mitura")
                        SettingsRowComponentView(name: "Compatibility", content: "iOS 15")
                        SettingsRowComponentView(name: "Website", linkLabel: "Ergo Proxy", linkDestenation: "ergoproxy.pl")
                        SettingsRowComponentView(name: "SwiftUI", content: "5.0")
                        SettingsRowComponentView(name: "Version", content: "1.0.0")
                    })//:BOX
                }//:VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                        ){
                                            Image(systemName: "xmark")
                                        }
                )
                .padding()
            }//:SCROLL
        }.alert(isPresented: $isSaved) {
            Alert(title: Text("Saved!"), message: Text("Budget saved successful"), dismissButton: .default(Text("OK")))
        } //:NAVIGATION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
