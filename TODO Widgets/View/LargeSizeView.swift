//
//  LargeSizeView.swift
//  TODO WidgetsExtension
//
//  Created by Jeet Rajput  on 06/02/22.
//

import SwiftUI
import WidgetKit

struct LargeSizeView: View {
    
    var entry: SimpleEntry
    
    var body: some View {
        VStack {
          
            HStack(spacing: 16) {
                
                Text("My Todos")
                Text(Date.now , format: .dateTime)
                Spacer()
                
            }
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipped()
            .shadow(radius: 5)
            
            ForEach(entry.arrTodo) { todo in
                
                Link(destination: URL(string: "myapp://todo/\(todo.id)")!) {
                    
                    HStack {
                        
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay {
                                
                                if todo.completed {
                                    Image(systemName: "checkmark")
                                }
                                
                            }
                        
                        Text(todo.title)
                        
                        Spacer()
                        
                        
                    }
                    .padding(.horizontal)
                    
                }
                
                Divider()
                
            }
            
            
            Spacer()
            
        }
        
    }
}

//struct LargeSizeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LargeSizeView(entry: .init(date: Date()))
//    }
//}
