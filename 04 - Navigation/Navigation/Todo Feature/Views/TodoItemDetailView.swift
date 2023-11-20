//
//  TodoItemDetailView.swift
//  StateManagement
//
//  Created by Vincent on 20/04/2023.
//

import SwiftUI

struct TodoItemDetailView: View {
    @Binding var item: TodoItem
    
    var body: some View {
        Form {
            TextField("Title", text: $item.title)
                .font(.headline)
            
            TextField("Description",
                      text: $item.description.whenEmpty(""))
            .font(.subheadline)
        }
        .navigationTitle("Edit")
    }
}

#Preview {
    StatefulPreviewWrapper(mockTodoItem) { todoItem in
        TodoItemDetailView(item: todoItem)
    }
}

private let mockTodoItem = TodoItem(id: UUID(), title: "Let's drink")
