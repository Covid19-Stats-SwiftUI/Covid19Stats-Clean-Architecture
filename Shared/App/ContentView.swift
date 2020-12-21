//
//  ContentView.swift
//  Shared
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: HomePresenter
  @EnvironmentObject var searchPresenter: SearchPresenter
  @EnvironmentObject var newsPresenter: NewsPresenter
  @StateObject var storeManager: StoreManager
  @State var selectedCountry: CountryModel?
  @State var selectedNews: NewsModel?
  
  @State var selection: String = "home"
  
  var body: some View {
    TabView(selection: $selection) {
      NavigationView {
        HomeView(presenter: homePresenter)
      }
      .tabItem {
        VStack {
          Image(systemName: "network")
          Text("Global Stats")
        }
      }
      .tag("home")
      
      SearchView(presenter: searchPresenter)
        .tabItem {
          VStack {
            Image(systemName: "magnifyingglass")
            Text("Search")
          }
        }
        .tag("search")
      
      NavigationView {
        NewsView(presenter: newsPresenter, storeManager: storeManager)
      }
      .tabItem {
        VStack {
          Image(systemName: "newspaper")
          Text("News")
        }
      }
      .tag("news")
    }
    .sheet(item: $selectedCountry, onDismiss: { 
      self.selectedCountry = nil
    }, content: { (country) in
      NavigationView {
        DetailCountryStatsView(country: country)
      }
    })
    .onOpenURL(perform: { url in
      
      self.selection = url.host ?? "home"
      
      if !(self.selection == "news") {
        guard let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems else {
          self.selectedCountry = nil
          return
        }
        
        var dict = [String: String]()
        queryItems.forEach { (item) in
          dict[item.name] = item.value
        }
        
        guard let name = dict["name"], let iso = dict["iso"] else {
          self.selectedCountry = nil
          return
        }
        
        self.selectedCountry = CountryModel(name: name, iso2: iso)
      }
      
    })
  }
}
