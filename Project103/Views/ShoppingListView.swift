//
//  ShoppingListView.swift
//  Project103
//
//  Created by mbair on 9/29/25.
//

import SwiftUI


struct ShoppingListView: View {
    @State private var shoppingList: [String] = ["Eggs", "Apples"]
    @State private var newItem: String = ""
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
                        ForEach(shoppingList, id:\.self){ item in
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
                    Button("Sort A -> Z"){
                         
                    }
                    Button("Reverse Order"){
                        
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
        }
    }
//    func sortAlphabetically (_ arrays: [[String]]) ->  [[String]] {
//        return arrays.sorted {
//            a,b in
//        }
//    }
//    func reverseItemList() -> {
//        //code
//    }
}   // END - ShoppingListView

#Preview {
    ShoppingListView()
}
