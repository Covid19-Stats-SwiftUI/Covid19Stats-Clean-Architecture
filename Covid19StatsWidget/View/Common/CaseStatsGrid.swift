//
//  CaseStatsGrid.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 06/12/20.
//

import SwiftUI

struct CaseStatsGrid: View {
  
  let totalCount: GlobalCaseStatsModel
  
  var body: some View {
    HStack(spacing: 0) {
      CaseStatsView(text: "Confirmed", totalCountText: totalCount.confirmedText, color: confirmedColor)
      
      CaseStatsView(text: "Recovered", totalCountText: totalCount.recoveredText, color: recoveredColor)
      
      CaseStatsView(text: "Death", totalCountText: totalCount.deathText, color: deathColor)
    }
  }
}
