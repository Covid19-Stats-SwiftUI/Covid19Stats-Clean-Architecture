//
//  Covid19StatsWidget.swift
//  Covid19StatsWidget
//
//  Created by Ari Supriatna on 05/12/20.
//

import WidgetKit
import SwiftUI

struct Covid19StatsWidgetEntryView: View {
  
  let entry: GlobalCaseStatsEntry
  @Environment(\.widgetFamily) var family
  
  var body: some View {
    switch family {
    case .systemSmall:
      EmptyView()
    case .systemMedium:
      GlobalCaseStatsWidgetMedium(entry: entry)
    case .systemLarge:
      GlobalCaseStatsWidgetLarge(entry: entry)
    @unknown default:
      EmptyView()
    }
  }
  
}

@main
struct Covid19StatsWidget: Widget {
  let kind: String = "Covid19StatsWidget"
  
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: GlobalCaseStatsProvider()) { entry in
      Covid19StatsWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
    .supportedFamilies([.systemMedium, .systemLarge])
  }
}

struct Covid19StatsWidget_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Covid19StatsWidgetEntryView(entry: .stub)
        .previewContext(WidgetPreviewContext(family: .systemMedium))
      
      Covid19StatsWidgetEntryView(entry: .stub)
        .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
  }
}
