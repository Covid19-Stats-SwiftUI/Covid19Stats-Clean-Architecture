//
//  SearchPresenter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import SwiftUI
import Combine

class SearchPresenter: ObservableObject {
  
  private let router = SearchRouter()
  private let searchUseCase: SearchUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState = false
  @Published var errorMessage: String = ""
  @Published var countries: [CountryModel] = []
  
  init(searchUseCase: SearchUseCase) {
    self.searchUseCase = searchUseCase
  }
  
  func getCountries() {
    isLoadingState = true
    
    searchUseCase.getCountries()
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
