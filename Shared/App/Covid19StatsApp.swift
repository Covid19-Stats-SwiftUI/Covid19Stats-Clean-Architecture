//
//  Covid19StatsApp.swift
//  Shared
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI
import StoreKit

@main
struct Covid19StatsApp: App {
  
  let productIDs = ["com.arisupriatna.Covid19Stats.IAP.NewsPremium"]
  
  @StateObject var homePresenter = HomePresenter(homeUseCase: Injection().provideHome())
  @StateObject var searchPresenter = SearchPresenter(searchUseCase: Injection().provideSearch())
  @StateObject var newsPresenter = NewsPresenter(newsUseCase: Injection().provideNews())
  @StateObject var storeManager = StoreManager()
  
  var body: some Scene {
    WindowGroup {
      ContentView(storeManager: storeManager)
        .environmentObject(homePresenter)
        .environmentObject(searchPresenter)
        .environmentObject(newsPresenter)
        .onAppear {
          storeManager.getProducts(productIDs: productIDs)
          SKPaymentQueue.default().add(storeManager)
        }
    }
  }
}
