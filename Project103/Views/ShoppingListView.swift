//
//  ShoppingListView.swift
//  Project103
//
//  Created by Emiliano on 9/29/25.
//

import SwiftUI


struct ShoppingListView: View {
    @State private var shoppingList: [String] = ["Eggs", "Apples", "Frozen Waffles", "Yogurt"]
    @State private var newItem: String = ""
    @State private var listOnDisplay:[String] = []
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Shopping List:")
                        .font(.largeTitle)
                        .foregroundStyle(Color.blue)
                        .padding()
                    
                    // List of items in the shopping list
                    List {
                        ForEach(listOnDisplay, id:\.self){ item in
                            Text(item)
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                    
                    HStack{
                        
                        TextField("Add new shopping item", text: $newItem)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius:20) .stroke(Color.gray, lineWidth:1) .opacity(0.2))
                            .padding()
                        
                        Button(action: {
                            addItem(item:newItem)
                            newItem = ""
                        }){
                            Image(systemName:"arrowshape.up.fill")
                                .padding()
                                .background(Color.blue)
                                .foregroundStyle(Color.white)
                                .cornerRadius(30)
                        }
                            
                    } // END - HStack
                    .padding()
                    
                }   // END - VStack
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(20)
                .padding()
                    
                
            }   // END - ZStack
            .navigationBarTitle("Listify", displayMode: .inline)
            
            .toolbar{
                Menu {
                    Button("Sort A > Z"){
                         sortAtoZ()
                    }
                    Button("Reverse Order"){
                        reverseList()
                    }
                    Button("Undo Sorting"){
                        listOnDisplay = shoppingList
                    }
                    .onAppear{
                        listOnDisplay = shoppingList
                    }
                }
             label : {
                Image(systemName:"arrow.up.arrow.down.circle")
                    .imageScale(.large)
            }
            .padding()
            }
                
        }   // END - NavigationView
        
    }   // END - Body
    private func addItem(item:String){
        if !item.isEmpty{
            shoppingList.append(item)
            listOnDisplay.append(item)
        }
    }
    func sortAtoZ() {
        listOnDisplay.sort()
    }
    func reverseList() {
        listOnDisplay.reverse()
    }
}   // END - ShoppingListView

#Preview {
    ShoppingListView()
}
