//
//  ContentView.swift
//  StateManagement
//
//  Created by Vincent on 13/04/2023.
//

import SwiftUI

struct TodoItemsListView: View {
    
    @StateObject var viewModel = TodoItemsListViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach($viewModel.todoItems) { $todoItem in
                    TodoItemRow(
                        item: $todoItem.onNewValue {
                            self.viewModel.reorder()
                        }
                    )
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from: to:))
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's taks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.loadItems()  // Because the init is called from the App init
            }
        }
    }
}

#Preview {
    TodoItemsListView()
}
