//
//  Covid19StatsApp.swift
//  Shared
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

@main
struct Covid19StatsApp: App {
  
  @StateObject var homePresenter = HomePresenter(homeUseCase: Injection().provideHome())
  @StateObject var searchPresenter = SearchPresenter(searchUseCase: Injection().provideSearch())
  @StateObject var newsPresenter = NewsPresenter(newsUseCase: Injection().provideNews())
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
        .environmentObject(searchPresenter)
        .environmentObject(newsPresenter)
    }
  }
}
