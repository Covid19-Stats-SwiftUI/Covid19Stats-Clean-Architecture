//
//  DetailView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 06/12/20.
//

import SwiftUI

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  
  var body: some View {
    ZStack {
      if let stats = presenter.stats {
        List {
          Section(header: Text("Stats of \(presenter.country.name)")) {
            GlobalStatsView(totalStats: stats)
          }
        }
        .listStyle(InsetGroupedListStyle())
      } else {
        ProgressView()
      }
    }
    .navigationBarTitle(Text(presenter.country.titleHeader), displayMode: .large)
    .onAppear {
      self.presenter.getStatsByCountry()
    }
  }
}

//struct DetailView_Previews: PreviewProvider {
//  static var previews: some View {
//    DetailView(presenter: DetailPresenter()
//  }
//}
