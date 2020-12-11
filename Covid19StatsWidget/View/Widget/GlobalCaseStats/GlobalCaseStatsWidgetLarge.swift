//
//  GlobalCaseStatsWidgetLarge.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 06/12/20.
//

import SwiftUI
import WidgetKit

struct GlobalCaseStatsWidgetLarge: View {
  
  let entry: GlobalCaseStatsEntry
  
  var body: some View {
    VStack(spacing: 0) {
      TitleDateHeaderView(title: entry.globalStats.title ?? "Global 🌍", date: entry.date)
        .padding(.vertical, 16)
        .padding(.horizontal)
      Divider()
      
      HStack {
        VStack {
          Image("close-contact")
          Text("Avoid close contact")
            .font(.system(size: 11))
        }
        
        Spacer()
        
        VStack {
          Image("clean-hands")
          Text("Clean your hands")
            .font(.system(size: 11))
        }
        
        Spacer()
        
        VStack {
          Image("wear-face-mask")
          Text("Wear a facemask")
            .font(.system(size: 11))
        }
      }
      .padding()
      
      CaseStatsGrid(totalCount: entry.globalStats)
        .cornerRadius(10)
        .padding(8)
    }
    .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
  }
}

struct GlobalCaseStatsWidgetLarge_Previews: PreviewProvider {
  static var previews: some View {
    GlobalCaseStatsWidgetLarge(entry: .init(date: Date(), globalStats: .stub))
      .previewContext(WidgetPreviewContext(family: .systemLarge))
  }
}
