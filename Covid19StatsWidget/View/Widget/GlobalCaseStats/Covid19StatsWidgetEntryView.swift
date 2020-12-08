//
//  Covid19StatsWidgetEntryView.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

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

struct Covid19StatsWidgetEntryView_Previews: PreviewProvider {
  static var previews: some View {
    Covid19StatsWidgetEntryView(entry: .stub)
  }
}
