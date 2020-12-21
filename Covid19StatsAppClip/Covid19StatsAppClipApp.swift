//
//  Covid19StatsAppClipApp.swift
//  Covid19StatsAppClip
//
//  Created by Ari Supriatna on 17/12/20.
//

import SwiftUI

@main
struct Covid19StatsAppClipApp: App {
  
  @StateObject var homePresenter = HomePresenter(homeUseCase: Injection().provideHome())
  @StateObject var searchPresenter = SearchPresenter(searchUseCase: Injection().provideSearch())
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
        .environmentObject(searchPresenter)
    }
  }
}
