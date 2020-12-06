//
//  ContentView.swift
//  Shared
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: HomePresenter
  
  var body: some View {
    HomeView(presenter: homePresenter)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
