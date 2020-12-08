//
//  NewsWidgetEntryView.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import SwiftUI

struct NewsWidgetEntryView: View {
  
  let entry: NewsEntry
  @Environment(\.widgetFamily) var family
  
  var body: some View {
    switch family {
    case .systemSmall:
      EmptyView()
    case .systemMedium:
      NewsWidgetMedium(entry: entry)
    case .systemLarge:
      NewsWidgetLarge(entry: entry)
    @unknown default:
      EmptyView()
    }
  }
  
}


struct NewsWidgetEntryView_Previews: PreviewProvider {
  static var previews: some View {
    NewsWidgetEntryView(entry: .stub)
  }
}
