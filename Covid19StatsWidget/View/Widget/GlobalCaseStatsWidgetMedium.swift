//
//  GlobalCaseStatsWidgetMedium.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 06/12/20.
//

import SwiftUI
import WidgetKit

let confirmedColor = Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.2980392157, alpha: 1))
let recoveredColor = Color(#colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.4823529412, alpha: 1))
let deathColor = Color(#colorLiteral(red: 1, green: 0.3490196078, blue: 0.3490196078, alpha: 1))

struct GlobalCaseStatsWidgetMedium: View {
  
  let entry: GlobalCaseStatsEntry
  
  var body: some View {
    VStack(spacing: 0) {
      TitleDateHeaderView(title: "Global Stats 🌍", date: entry.date)
        .padding(.vertical, 4)
        .padding(.horizontal)
      
      CaseStatsGrid(totalCount: entry.globalStats)
    }
    .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
  }
}

struct GlobalCaseStatsWidgetMedium_Previews: PreviewProvider {
  static var previews: some View {
    GlobalCaseStatsWidgetMedium(entry: .init(date: Date(), globalStats: .stub))
      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
