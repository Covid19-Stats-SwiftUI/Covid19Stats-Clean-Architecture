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
            VStack(alignment: .leading, spacing: 16) {
              Text("Confirmed")
                .font(.title3)
                .bold()
              
              Text(stats.confirmedText)
                .fontWeight(.semibold)
                .foregroundColor(Color("confirmedColor"))
              
              Text("Recovered")
                .font(.title3)
                .bold()
              
              Text(stats.recoveredText)
                .fontWeight(.semibold)
                .foregroundColor(Color("recoveredColor"))
              
              Text("Deaths")
                .font(.title3)
                .bold()
              
              Text(stats.deathText)
                .fontWeight(.semibold)
                .foregroundColor(Color("deathColor"))
            }
            .padding(.vertical)
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
