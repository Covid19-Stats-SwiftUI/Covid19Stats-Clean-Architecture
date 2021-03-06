//
//  NewsEntry.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import Foundation
import WidgetKit

struct NewsEntry: TimelineEntry {
  
  public let date: Date
  public var isPlaceholder = false
  public let news: [News]
  
}

extension NewsEntry {
  
  static var stub: NewsEntry {
    .init(date: Date(), news: [.stub, .stub, .stub, .stub, .stub, .stub])
  }
  
  static var placeholder: NewsEntry {
    .init(date: Date(), isPlaceholder: true, news: [.stub, .stub, .stub, .stub, .stub, .stub])
  }
  
}
