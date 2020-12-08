//
//  GlobalCaseStatsProvider.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation
import WidgetKit

struct GlobalCaseStatsProvider: TimelineProvider {
  
  typealias Entry = GlobalCaseStatsEntry
  
  let remote = RemoteDataSource.sharedInstance

  func placeholder(in context: Context) -> GlobalCaseStatsEntry {
    .placeholder
  }

  func getSnapshot(in context: Context, completion: @escaping (GlobalCaseStatsEntry) -> Void) {
    if context.isPreview {
      completion(.placeholder)
    } else {
      fetchGlobalCaseStats { (result) in
        switch result {
        case .success(let entry):
          completion(entry)
        case .failure:
          completion(.placeholder)
        }
      }
    }
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<GlobalCaseStatsEntry>) -> Void) {
    fetchGlobalCaseStats { (result) in
      switch result {
      case .success(let entry):
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 10)))
        completion(timeline)
      case .failure:
        let timeline = Timeline(entries: [GlobalCaseStatsEntry.placeholder], policy: .after(Date().addingTimeInterval(60 * 2)))
        completion(timeline)
      }
    }
  }

  private func fetchGlobalCaseStats(completion: @escaping (Result<GlobalCaseStatsEntry, Error>) -> Void) {
    remote.getGlobalCaseStats { (result) in
      switch result {
      case .success(let globalStats):
        let entry = GlobalCaseStatsEntry(date: Date(), globalStats: .init(confirmed: globalStats.confirmed, recovered: globalStats.recovered, deaths: globalStats.deaths))
        completion(.success(entry))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
