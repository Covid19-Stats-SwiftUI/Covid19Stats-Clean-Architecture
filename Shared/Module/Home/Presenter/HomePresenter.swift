//
//  HomePresenter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Combine
import SwiftUI

class HomePresenter: ObservableObject {
  
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState = false
  @Published var globalStats: GlobalCaseStatsModel?
  @Published var errorMessage: String = ""
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getGlobalCaseStats() {
    isLoadingState = true
    
    homeUseCase.getGlobalCaseStats()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          self.isLoadingState = false
          self.errorMessage = String(describing: error)
        case .finished:
          self.isLoadingState = false
        }
      }, receiveValue: { result in
        self.globalStats = result
      })
      .store(in: &cancellables)
  }
  
  func linkBuilderDetailGlobalStats<Content: View>(
    by caseType: CovidEndpoints.CaseType,
    isActive: Binding<Bool>,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(
      destination: router.makeDetailGlobalStatsView(by: caseType), isActive: isActive) { content() }
  }
  
}
