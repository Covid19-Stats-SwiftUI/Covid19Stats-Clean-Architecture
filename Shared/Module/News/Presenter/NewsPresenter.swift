//
//  NewsPresenter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Combine
import SwiftUI

class NewsPresenter: ObservableObject {
  
  private let newsUseCase: NewsUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState = false
  @Published var errorMessage: String = ""
  @Published var news: [NewsModel]?
  
  init(newsUseCase: NewsUseCase) {
    self.newsUseCase = newsUseCase
  }
  
  func getNews() {
    isLoadingState = true
    
    newsUseCase.getNews()
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
        self.news = result
      })
      .store(in: &cancellables)
  }
  
}
