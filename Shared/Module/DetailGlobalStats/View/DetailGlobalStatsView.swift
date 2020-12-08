//
//  DetailGlobalStatsView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 06/12/20.
//

import SwiftUI

struct DetailGlobalStatsView: View {
  
  @ObservedObject var presenter: DetailGlobalStatsPresenter
  var caseType: CovidEndpoints.CaseType
  
  var titleHeader: String {
    switch caseType {
    case .confirmed:
      return "Confirmed Stats"
    case .recovered:
      return "Recovered Stats"
    case .deaths:
      return "Deaths Stats"
    }
  }
  
  var body: some View {
    ZStack {
      if presenter.isLoadingState {
        ProgressView()
      } else {
        List {
          ForEach(presenter.stats.suffix(20)) { result in
            DisplayName(stats: result, caseType: caseType)
          }
        }
        .listStyle(InsetGroupedListStyle())
      }
    }
    .navigationTitle(titleHeader)
    .onAppear {
      if self.presenter.stats.count == 0 {
        self.presenter.getDetailGlobalStats(by: caseType)
      }
    }
  }
}

struct DisplayName: View {
  
  var stats: CountryCaseStatsModel
  var caseType: CovidEndpoints.CaseType
  
  var totalCase: Int {
    switch caseType {
    case .confirmed:
      return stats.confirmed
    case .recovered:
      return stats.recovered
    case .deaths:
      return stats.deaths
    }
  }
  
  @ViewBuilder
  var body: some View {
    Text("\(stats.displayName): \(totalCase)")
  }
  
}

//struct DetailGlobalStatsView_Previews: PreviewProvider {
//  static var previews: some View {
//    DetailGlobalStatsView()
//  }
//}
