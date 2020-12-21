//
//  GlobalCaseStatsIntentTimelineProvider.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 10/12/20.
//

import Foundation
import WidgetKit

struct GlobalCaseStatsIntentTimelineProvider: IntentTimelineProvider {
  
  typealias Entry = GlobalCaseStatsEntry
  typealias Intent = SelectCountryIntent
  
  let remoteService = RemoteDataSource.sharedInstance
  
  func placeholder(in context: Context) -> GlobalCaseStatsEntry {
    .placeholder
  }
  
  func getSnapshot(for configuration: SelectCountryIntent, in context: Context, completion: @escaping (GlobalCaseStatsEntry) -> Void) {
    if context.isPreview {
      completion(.placeholder)
    } else {
      fetchGlobalCaseStats(for: configuration.country ?? CountryParam.global) { (result) in
        switch result {
        case .success(let entry):
          completion(entry)
        case .failure:
          completion(.placeholder)
        }
      }
    }
  }
  
  func getTimeline(for configuration: SelectCountryIntent, in context: Context, completion: @escaping (Timeline<GlobalCaseStatsEntry>) -> Void) {
    fetchGlobalCaseStats(for: configuration.country ?? CountryParam.global) { (result) in
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
  
  private func fetchGlobalCaseStats(for param: CountryParam, completion: @escaping (Result<GlobalCaseStatsEntry, Error>) -> Void) {
    
    guard let id = param.identifier else {
      completion(.failure(Covid19APIError.noData))
      return
    }
    
    switch id {
    case CountryParam.global.identifier:
      remoteService.getGlobalCaseStats { (result) in
        switch result {
        case .success(let stats):
          let globalStatsEntry = GlobalCaseStatsEntry(date: Date(), globalStats: .init(title: "Global 🌍", confirmed: stats.confirmed, recovered: stats.recovered, deaths: stats.deaths), url: URL(string: "stats://home"))
          completion(.success(globalStatsEntry))
        case .failure(let error):
          completion(.failure(error))
        }
      }
    default:
      remoteService.getStatsByCountry(country: id) { (result) in
        switch result {
        case .success(let stats):
          let globalStastEntry = GlobalCaseStatsEntry(
            date: Date(),
            globalStats: .init(title: param.displayString, confirmed: stats.confirmed, recovered: stats.recovered, deaths: stats.deaths),
            url: URL(string: "stats://search?id=\(id)&name=\(id)&iso=\(param.iso2 ?? "")".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
          )
          completion(.success(globalStastEntry))
        case .failure(let error):
          completion(.failure(error))
        }
      }
    }
    
  }
  
}
