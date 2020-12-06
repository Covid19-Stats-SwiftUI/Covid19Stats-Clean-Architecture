//
//  HomeView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    NavigationView {
      ZStack {
        if let countries = presenter.countries,
           let global = presenter.globalStats,
           let confirmed = presenter.statsConfirmed,
           let recovered = presenter.statsRecovered,
           let death = presenter.statsDeaths {
          List {
            Section(header: Text("Global Stats 🌍")) {
              GlobalStatsView(totalStats: global)
            }
            
            Section(header: Text("Countries Daily Stats")) {
              ForEach(countries.suffix(10)) { countryStat in
                self.presenter.linkBuilder(for: countryStat) {
                  Text(countryStat.displayName)
                }
              }
            }
            
            Section(header: Text("Confirmed Stats")) {
              ForEach(confirmed.suffix(10).filter { $0.provinceState != "Unknown" }) { result in
                Text("\(result.displayName): \(result.confirmed)")
              }
            }
            
            Section(header: Text("Recovered Stats")) {
              ForEach(recovered.suffix(10)) { result in
                Text("\(result.displayName): \(result.recovered)")
              }
            }
            
            Section(header: Text("Death Stats")) {
              ForEach(death.suffix(10)) { result in
                Text("\(result.displayName): \(result.deaths)")
              }
            }
          }
          .listStyle(InsetGroupedListStyle())
        } else {
          ProgressView()
        }
        
      }
      .navigationTitle("Daily Summary")
      .onAppear {
        self.presenter.getCountries()
        self.presenter.getGlobalCaseStats()
        self.presenter.getCountryCaseStatsConfirmed()
        self.presenter.getCountryCaseStatsRecovered()
        self.presenter.getCountryCaseStatsDeath()
      }
    }
  }
}

//struct HomeView_Previews: PreviewProvider {
//  static var previews: some View {
//    HomeView(presenter: HomePresenter(homeUseCase: HomeInteractor(repository: T##CovidRepositoryProtocol)))
//  }
//}
