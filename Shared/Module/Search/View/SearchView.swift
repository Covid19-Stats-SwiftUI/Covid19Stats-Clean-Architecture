//
//  SearchView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import SwiftUI

struct SearchView: View {
  
  @ObservedObject var presenter: SearchPresenter
  @State var searchText: String = ""
  
  var body: some View {
    ZStack {
      if let countries = presenter.countries {
        SearchBar(text: $searchText) {
          List(countries.filter({ (country) -> Bool in
            if searchText == "" {
              return true
            } else {
              return country.name.lowercased().contains(searchText.lowercased())
            }
          })) { country in
            self.presenter.linkBuilder(for: country) {
              Text(country.displayName)
                .font(.system(size: 18))
            }
          }
          .navigationTitle("Search Country")
          .listStyle(PlainListStyle())
        }
        .ignoresSafeArea()
      } else {
        ProgressView()
      }
    }
    .onAppear {
      self.presenter.getCountries()
    }
  }
}
