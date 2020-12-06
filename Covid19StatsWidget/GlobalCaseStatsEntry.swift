//
//  GlobalCaseStatsEntry.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation
import WidgetKit

struct GlobalCaseStatsEntry: TimelineEntry {
  
  var date: Date
  var isPlaceholder = false
  let globalStats: GlobalCaseStatsModel
  
}

extension GlobalCaseStatsEntry {
  
  static var stub: GlobalCaseStatsEntry {
    .init(date: Date(), globalStats: GlobalCaseStatsModel(confirmed: GlobalCaseStatsModel.ValueModel(value: 100), recovered: GlobalCaseStatsModel.ValueModel(value: 100), deaths: GlobalCaseStatsModel.ValueModel(value: 100)))
  }
  
  static var placeholder: GlobalCaseStatsEntry {
    .init(date: Date(), isPlaceholder: true, globalStats: .init(confirmed: GlobalCaseStatsModel.ValueModel(value: 100), recovered: GlobalCaseStatsModel.ValueModel(value: 100), deaths: GlobalCaseStatsModel.ValueModel(value: 100)))
  }
  
}
