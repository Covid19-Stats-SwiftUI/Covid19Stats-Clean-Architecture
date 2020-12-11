//
//  Covid19StatsWidget.swift
//  Covid19StatsWidget
//
//  Created by Ari Supriatna on 05/12/20.
//

import WidgetKit
import SwiftUI

struct Covid19StatsWidget: Widget {
  let kind: String = "Covid19StatsWidget"
  
  var body: some WidgetConfiguration {
    IntentConfiguration(kind: kind, intent: SelectCountryIntent.self, provider: GlobalCaseStatsIntentTimelineProvider(), content: { (entry) in
      Covid19StatsWidgetEntryView(entry: entry)
    })
    .configurationDisplayName("Covid19 Stats Widget")
    .description("Show Covid19 stats global")
    .supportedFamilies([.systemMedium, .systemLarge])
  }
}

struct NewsWidget: Widget {
  let kind: String = "NewsWidget"
  
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: NewsProvider()) { entry in
      NewsWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("News Widget")
    .description("Show News about health")
    .supportedFamilies([.systemMedium, .systemLarge])
  }
}

@main
struct Covid19StatsBundle: WidgetBundle {
  @WidgetBundleBuilder
  var body: some Widget {
    Covid19StatsWidget()
    NewsWidget()
  }
}

struct Covid19StatsWidget_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Covid19StatsWidgetEntryView(entry: .stub)
        .previewContext(WidgetPreviewContext(family: .systemMedium))
      
      NewsWidgetEntryView(entry: .stub)
        .previewContext(WidgetPreviewContext(family: .systemMedium))
      
      Covid19StatsWidgetEntryView(entry: .stub)
        .previewContext(WidgetPreviewContext(family: .systemLarge))
      
      NewsWidgetEntryView(entry: .stub)
        .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
  }
}
