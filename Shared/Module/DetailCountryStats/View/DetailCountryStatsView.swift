//
//  DetailCountryStatsView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 17/12/20.
//

import SwiftUI

struct DetailCountryStatsView: View {
  @StateObject var presenter = DetailCountryStatsPresenter()
  var country: CountryModel
  
  var body: some View {
    ZStack {
      if let stats = presenter.stats {
        List {
          Section(header: Text("Stats of \(country.displayName)")) {
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
    .navigationBarTitle(Text(country.displayName), displayMode: .large)
    .onAppear {
      self.presenter.getStatsByCountry(for: country.name)
    }
  }
}

//struct DetailCountryStatsView_Previews: PreviewProvider {
//  static var previews: some View {
//    DetailCountryStatsView()
//  }
//}
