//
//  DetailCountryStatsPresenter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 17/12/20.
//

import Foundation
import Combine

class DetailCountryStatsPresenter: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let remote: CovidNetworkDataSource = CovidNetworkDataSource.sharedInstance
  
  @Published var isLoadingState = false
  @Published var errorMessage: String = ""
  @Published var stats: GlobalCaseStatsModel?
  
  func getStatsByCountry(for countryName: String) {
    isLoadingState = true
    
    self.remote.getStatsByCountry(country: countryName)
      .map { GlobalCaseStatsMapper.mapGlobalCaseStatsResponseToDomains(confirmed: $0.confirmed, recovered: $0.recovered, deaths: $0.deaths) }
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
        self.stats = result
      })
      .store(in: &cancellables)
    
  }
  
}
