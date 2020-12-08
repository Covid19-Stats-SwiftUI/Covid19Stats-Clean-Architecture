//
//  HomeRouter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailGlobalStatsView(by caseType: CovidEndpoints.CaseType) -> some View {
    let detailUseCase = Injection.init().provideDetailGlobalStats(by: caseType)
    let presenter = DetailGlobalStatsPresenter(globalStatsUseCase: detailUseCase)
    
    return DetailGlobalStatsView(presenter: presenter, caseType: caseType)
  }
  
}
