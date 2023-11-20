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
                    NavigationLink(value: todoItem) {
                        TodoItemRow(
                            item: $todoItem.onNewValue {
                                self.viewModel.reorder()
                            }
                        )
                    }
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from: to:))
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Today's taks")
            .navigationDestination(
                for: TodoItem.self,
                destination: { todoItem in
                    let todoItemBinding = Binding<TodoItem>(
                        get: {
                            viewModel.todoItems.first(where: { $0.id == todoItem.id })!
                        },
                        set: { _ in
                            let index = viewModel.todoItems.firstIndex(where: { $0.id == todoItem.id })!
                            viewModel.todoItems[index] = todoItem
                        }
                    )
                    TodoItemDetailView(item: todoItemBinding)
                }
            )
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemsListView()
    }
}
