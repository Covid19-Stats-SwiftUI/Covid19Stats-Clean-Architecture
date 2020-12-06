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
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
    }
  }
}
