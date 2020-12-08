//
//  NewsEntry.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import Foundation
import WidgetKit

struct NewsEntry: TimelineEntry {
  
  var date: Date
  var isPlaceholder = false
  var news: [NewsModel]
  
}

extension NewsEntry {
  
  static var stub: NewsEntry {
    .init(date: Date(), news: [.stub, .stub, .stub, .stub, .stub, .stub])
  }
  
  static var placeholder: NewsEntry {
    .init(date: Date(), isPlaceholder: true, news: [.stub, .stub, .stub, .stub, .stub, .stub])
  }
  
}
