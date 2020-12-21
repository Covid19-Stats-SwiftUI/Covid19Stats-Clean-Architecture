//
//  GlobalStatsView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

struct GlobalStatsView: View {
  
  @ObservedObject var presenter: HomePresenter
  @State var isActiveConfirmed: Bool = false
  @State var isActiveRecovered: Bool = false
  @State var isActiveDeaths: Bool = false
  var totalStats: GlobalCaseStatsModel
  
  var body: some View {
    VStack {
      #if !APPCLIP
      presenter.linkBuilderDetailGlobalStats(by: .confirmed, isActive: $isActiveConfirmed) {
        EmptyView()
      }
      
      presenter.linkBuilderDetailGlobalStats(by: .recovered, isActive: $isActiveRecovered) {
        EmptyView()
      }
      
      presenter.linkBuilderDetailGlobalStats(by: .deaths, isActive: $isActiveDeaths) {
        EmptyView()
      }
      #endif
      
      ContainerStatsView(
        title: "Confirmed",
        countStats: totalStats.confirmedText,
        color: Color("confirmedColor")
      )
      .padding(.bottom, 8)
      .onTapGesture {
        self.isActiveConfirmed = true
      }
      
      HStack(spacing: 16) {
        ContainerStatsView(
          title: "Recovered",
          countStats: totalStats.recoveredText,
          color: Color("recoveredColor")
        )
        .onTapGesture {
          self.isActiveRecovered = true
        }
        
        ContainerStatsView(
          title: "Deaths",
          countStats: totalStats.deathText,
          color: Color("deathColor")
        )
        .onTapGesture {
          self.isActiveDeaths = true
        }
      }
      
    }
  }
}

struct ContainerStatsView: View {
  
  var title: String
  var countStats: String
  var color: Color
  
  var body: some View {
    ZStack {
      color
      
      HStack {
        VStack(alignment: .leading, spacing: 22) {
          Text(title)
            .foregroundColor(.white)
          
          Text(countStats)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }
        
        Spacer()
      }
      .padding(.all)
    }
    .cornerRadius(10)
  }
  
}
