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
    HStack(alignment: .top) {
      
      presenter.linkBuilderDetailGlobalStats(by: .confirmed, isActive: $isActiveConfirmed) {
        EmptyView()
      }
      
      presenter.linkBuilderDetailGlobalStats(by: .recovered, isActive: $isActiveRecovered) {
        EmptyView()
      }
      
      presenter.linkBuilderDetailGlobalStats(by: .deaths, isActive: $isActiveDeaths) {
        EmptyView()
      }
      
      VStack(alignment: .leading, spacing: 24) {
        Text("Confirmed")
          .foregroundColor(.white)
          .font(.system(size: 14, weight: .semibold, design: .rounded))
        
        Text(totalStats.confirmedText)
          .foregroundColor(.white)
          .font(.system(size: 18, weight: .bold, design: .rounded))
      }
      .padding(8)
      .frame(maxWidth: .infinity)
      .background(Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.2980392157, alpha: 1)))
      .cornerRadius(8)
      .onTapGesture {
        self.isActiveConfirmed = true
      }
      
      VStack(alignment: .leading, spacing: 24) {
        Text("Recovered")
          .foregroundColor(.white)
          .font(.system(size: 14, weight: .semibold, design: .rounded))
        
        Text(totalStats.recoveredText)
          .foregroundColor(.white)
          .font(.system(size: 18, weight: .bold, design: .rounded))
      }
      .padding(8)
      .frame(maxWidth: .infinity)
      .background(Color(#colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.4823529412, alpha: 1)))
      .cornerRadius(8)
      .onTapGesture {
        self.isActiveRecovered = true
      }
      
      VStack(alignment: .leading, spacing: 24) {
        Text("Death")
          .foregroundColor(.white)
          .font(.system(size: 14, weight: .semibold, design: .rounded))
        
        Text(totalStats.deathText)
          .foregroundColor(.white)
          .font(.system(size: 18, weight: .bold, design: .rounded))
      }
      .padding(8)
      .frame(maxWidth: .infinity)
      .background(Color(#colorLiteral(red: 1, green: 0.3490196078, blue: 0.3490196078, alpha: 1)))
      .cornerRadius(8)
      .onTapGesture {
        self.isActiveDeaths = true
      }
      
    }
  }
}

//struct GlobalStatsView_Previews: PreviewProvider {
//  static var previews: some View {
//    GlobalStatsView(totalStats: .stub)
//  }
//}
