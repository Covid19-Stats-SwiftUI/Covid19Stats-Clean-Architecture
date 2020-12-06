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
  @Published var countries: [CountryModel] = []
  @Published var statsConfirmed: [CountryCaseStatsModel] = []
  @Published var statsRecovered: [CountryCaseStatsModel] = []
  @Published var statsDeaths: [CountryCaseStatsModel] = []
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
  
  func getCountryCaseStatsConfirmed() {
    isLoadingState = true
    
    homeUseCase.getCountryCaseStatsConfirmed(by: .confirmed)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          self.isLoadingState = false
          self.errorMessage = String(describing: error)
          print("Error getCountryCaseStatsConfirmed() => \(self.errorMessage)")
        case .finished:
          self.isLoadingState = false
        }
      }, receiveValue: { result in
        self.statsConfirmed = result
      })
      .store(in: &cancellables)
  }
  
  func getCountryCaseStatsRecovered() {
    isLoadingState = true
    
    homeUseCase.getCountryCaseStatsRecovered(by: .recovered)
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
        self.statsRecovered = result
      })
      .store(in: &cancellables)
  }
  
  func getCountryCaseStatsDeath() {
    isLoadingState = true
    
    homeUseCase.getCountryCaseStatsDeath(by: .deaths)
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
        self.statsDeaths = result
      })
      .store(in: &cancellables)
  }
  
  func getCountries() {
    isLoadingState = true
    
    homeUseCase.getCountries()
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
        self.countries = result
      })
      .store(in: &cancellables)
  }
  
  func linkBuilder<Content: View>(
    for country: CountryModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeDetailView(for: country)) {
      content()
    }
  }
  
}
