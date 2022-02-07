//
//  Provider.swift
//  TODO WidgetsExtension
//
//  Created by Jeet Rajput  on 01/02/22.
//

import Foundation
import  WidgetKit


struct Provider: TimelineProvider {
    
    typealias Entry = SimpleEntry
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), arrTodo: [.setPlaceHolder(0) , .setPlaceHolder(1)])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task{
            do {
             
                let todos = try await TodoService.shared.getAllTodos()
                let fiveTodos = Array(todos.prefix(5))
                let entry = SimpleEntry(date: .now, arrTodo: fiveTodos)
                completion(entry)
                
            } catch {
                print(error)
                completion(SimpleEntry(date: .now, arrTodo: [.setPlaceHolder(0)]))
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        Task {
            
            do {
                
                let todos = try await TodoService.shared.getAllTodos()
                let fiveTodos = Array(todos.prefix(5))
                let entry = SimpleEntry(date: .now, arrTodo: fiveTodos)
                let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60*60*30)))
                completion(timeline)
                
            } catch {
                let entry = SimpleEntry(date: .now, arrTodo: [.setPlaceHolder(0)])
                let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60*60*30)))
                completion(timeline)
            }
            
        }
        
    }
}
