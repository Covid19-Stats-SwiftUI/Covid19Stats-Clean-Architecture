//
//  NewsRowView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsRowView: View {
  
  var news: NewsModel
  
  var body: some View {
    HStack {
      WebImage(url: URL(string: news.urlToImage))
        .resizable()
        .indicator(.activity)
        .transition(.fade(duration: 0.5))
        .scaledToFit()
        .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(news.source.name)
          .font(.caption)
          .foregroundColor(.secondary)
        
        Text(news.title)
          .font(.headline)
          .lineLimit(4)
      }
    }
    .contextMenu(ContextMenu(menuItems: {
      Label("Add to favorite", systemImage: "suit.heart")
    }))
  }
}

struct NewsRowView_Previews: PreviewProvider {
  static var previews: some View {
    NewsRowView(news: .stub)
  }
}
