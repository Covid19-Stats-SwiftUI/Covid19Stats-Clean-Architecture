//
//  NewsWidgetLarge.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import SwiftUI
import WidgetKit

struct NewsWidgetLarge: View {
  
  let entry: NewsEntry
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Top Headlines")
        .font(.subheadline)
        .fontWeight(.bold)
      
      ForEach(entry.news.prefix(5), id: \.self) { result in
        NewsRowView(news: result)
          .widgetURL(URL(string: "stats://news?url=\(result.url ?? "")"))
          .padding(.vertical, 4)
      }
    }
    .padding(.all, 16)
    .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
  }
}

struct NewsWidgetLarge_Previews: PreviewProvider {
  static var previews: some View {
    NewsWidgetLarge(entry: .init(date: Date(), news: [.stub, .stub, .stub, .stub, .stub, .stub]))
      .previewContext(WidgetPreviewContext(family: .systemLarge))
  }
}
