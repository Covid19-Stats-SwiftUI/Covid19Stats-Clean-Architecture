//
//  DetailGlobalStatsPresenter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 06/12/20.
//

import Foundation
import Combine

class DetailGlobalStatsPresenter: ObservableObject {
  
  private let globalStatsUseCase: DetailGlobalStatsUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState = false
  @Published var stats: [CountryCaseStatsModel] = []
  @Published var errorMessage: String = ""
  
  init(globalStatsUseCase: DetailGlobalStatsUseCase) {
    self.globalStatsUseCase = globalStatsUseCase
  }
  
  func getDetailGlobalStats(by caseType: Endpoints.CaseType) {
    isLoadingState = true
    
    globalStatsUseCase.getDetailGlobalStats(by: caseType)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          self.isLoadingState = false
          self.errorMessage = String(describing: error)
          debugPrint("errorMessage: \(self.errorMessage)")
        case .finished:
          self.isLoadingState = false
          debugPrint("isLoading: \(self.isLoadingState)")
        }
      }, receiveValue: { result in
        self.stats = result
        debugPrint("Result: \(self.stats)")
      })
      .store(in: &cancellables)
  }
  
}
