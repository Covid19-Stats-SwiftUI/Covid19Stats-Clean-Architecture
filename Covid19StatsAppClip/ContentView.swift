//
//  ContentView.swift
//  Covid19StatsAppClip
//
//  Created by Ari Supriatna on 17/12/20.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: HomePresenter
  @EnvironmentObject var searchPresenter: SearchPresenter
  
  var body: some View {
    TabView {
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
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
