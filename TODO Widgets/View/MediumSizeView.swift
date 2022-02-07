//
//  MediumSizeView.swift
//  TODO WidgetsExtension
//
//  Created by Jeet Rajput  on 06/02/22.
//

import SwiftUI
import WidgetKit

struct MediumSizeView: View {
    
    var entry: SimpleEntry
    
    var body: some View {
        GroupBox {
            
            HStack {
                
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.secondary)
                
                Divider()
                if let todo = entry.arrTodo.first {
                    
                    VStack(alignment: .leading){
                        
                        Text(todo.title)
                            .font(.headline)
                        
                        Text(todo.completed ? "Completed" : "Open")
                            .font(.subheadline)
                        
                        
                    }
                    
                }
                Spacer()
                                     
                                
                
            }
            .padding()
            
        } label: {
            Label("My Todos", systemImage: "list.dash")
        }
        .widgetURL(URL(string: "myapp://todo/\(entry.arrTodo.first?.id ?? 0)"))

    }
}

//struct MediumSizeView_Previews: PreviewProvider {
//    static var previews: some View {
//        MediumSizeView(entry: .init(date: Date()))
//    }
//}
