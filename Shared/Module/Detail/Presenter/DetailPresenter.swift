//
//  DetailPresenter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 06/12/20.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
  
  private let detailUseCase: DetailUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var country: CountryModel
  @Published var isLoadingState = false
  @Published var errorMessage: String = ""
  @Published var stats: GlobalCaseStatsModel?
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    country = detailUseCase.getCountry()
  }
  
  func getStatsByCountry() {
    isLoadingState = true
    
    detailUseCase.getStatsByCountry()
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
