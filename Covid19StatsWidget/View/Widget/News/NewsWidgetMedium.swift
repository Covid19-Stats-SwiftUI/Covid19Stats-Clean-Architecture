//
//  NewsWidgetMedium.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import SwiftUI
import WidgetKit

struct NewsWidgetMedium: View {
  
  let entry: NewsEntry
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Top Headlines")
        .font(.subheadline)
        .fontWeight(.bold)
      
      ForEach(entry.news.prefix(2), id: \.self) { result in
        NewsRowView(news: result)
          .widgetURL(URL(string: "stats://news?url=\(result.url ?? "")"))
      }
    }
    .padding(.all, 16)
    .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
  }
}

struct NewsWidgetMedium_Previews: PreviewProvider {
  static var previews: some View {
    NewsWidgetMedium(entry: .init(date: Date(), news: [.stub, .stub]))
      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
