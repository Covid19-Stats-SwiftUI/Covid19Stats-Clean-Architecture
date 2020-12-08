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
  
  @State var selectedTab: String = "home"
  
  var body: some View {
    TabView(selection: $selectedTab) {
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
        NewsView(presenter: newsPresenter)
      }
      .tabItem {
        VStack {
          Image(systemName: "newspaper")
          Text("News")
        }
      }
      .tag("news")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
