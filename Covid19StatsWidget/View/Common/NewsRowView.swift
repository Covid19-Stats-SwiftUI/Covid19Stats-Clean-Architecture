//
//  NewsRowView.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import SwiftUI
import WidgetKit

struct NewsRowView: View {
  
  var news: News
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(news.source?.name.uppercased() ?? "Unknown".uppercased())
          .font(.caption2)
          .fontWeight(.medium)
          .foregroundColor(.secondary)
        
        Text(news.title ?? "Unknown")
          .font(.caption)
          .fontWeight(.semibold)
          .lineLimit(2)
      }
      
      Spacer()
      
      NetworkImage(url: URL(string: news.urlToImage ?? "https://ec.europa.eu/programmes/creative-europe/sites/default/files/covid19-cdc-unsplash.jpg"))
        .frame(width: 80)
        .cornerRadius(8)
    }
  }
}

struct NewsRowView_Previews: PreviewProvider {
  static var previews: some View {
    NewsRowView(news: .stub)
      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
