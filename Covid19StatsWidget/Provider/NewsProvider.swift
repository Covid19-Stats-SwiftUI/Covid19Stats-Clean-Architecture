//
//  NewsProvider.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import Foundation
import WidgetKit

struct NewsProvider: TimelineProvider {

  typealias Entry = NewsEntry
  
  let remote = RemoteDataSource.sharedInstance
  
  func placeholder(in context: Context) -> NewsEntry {
    .placeholder
  }
  
  func getSnapshot(in context: Context, completion: @escaping (NewsEntry) -> Void) {
    if context.isPreview {
      completion(.placeholder)
    } else {
      fetchNews { (result) in
        switch result {
        case .success(let entry):
          completion(entry)
        case .failure:
          completion(.placeholder)
        }
      }
    }
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<NewsEntry>) -> Void) {
    fetchNews { (result) in
      switch result {
      case .success(let entry):
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 10)))
        completion(timeline)
      case .failure:
        let timeline = Timeline(entries: [NewsEntry.placeholder], policy: .after(Date().addingTimeInterval(60 * 2)))
        completion(timeline)
      }
    }
  }
  
  private func fetchNews(completion: @escaping (Result<NewsEntry, Error>) -> Void) {
    remote.getNewsTopHeadlines { (result) in
      switch result {
      case .success(let news):
        let entry = NewsEntry(date: Date(), news: news.articles)
        completion(.success(entry))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
}
