//
//  TODO_Widgets.swift
//  TODO Widgets
//
//  Created by Jeet Rajput  on 01/02/22.
//

import WidgetKit
import SwiftUI




@main
struct TODO_Widgets: Widget {
    let kind: String = "TODO_Widgets"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widgetView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("My Todos")
        .description("View your latest todos.")
    }
}

struct TODO_Widgets_Previews: PreviewProvider {
    static var previews: some View {
        widgetView(entry: SimpleEntry(date: Date(), arrTodo: [.setPlaceHolder(0),.setPlaceHolder(1)]))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
