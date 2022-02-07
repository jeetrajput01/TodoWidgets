//
//  View.swift
//  TODO WidgetsExtension
//
//  Created by Jeet Rajput  on 01/02/22.
//

import SwiftUI
import WidgetKit


struct widgetView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
            
        case .systemMedium:
            MediumSizeView(entry: entry)
            
        case .systemLarge:
            LargeSizeView(entry: entry)
         
        default:
            Text("Not Implemented!")
    
        }
    }
}
