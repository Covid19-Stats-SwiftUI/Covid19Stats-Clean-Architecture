//
//  GlobalStatsView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

struct GlobalStatsView: View {
  
  var totalStats: GlobalCaseStatsModel
  
  var body: some View {
    VStack {
      
      VStack(alignment: .leading, spacing: 8) {
        HStack {
          Text("Confirmed")
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .semibold, design: .rounded))
          Spacer()
        }
        Spacer()
        Text(totalStats.confirmedText)
          .foregroundColor(.white)
          .font(.system(size: 18, weight: .bold, design: .rounded))
      }
      .padding(8)
      .background(Color(#colorLiteral(red: 1, green: 0.7411764706, blue: 0.2980392157, alpha: 1)))
      .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 8) {
        HStack {
          Text("Recovered")
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .semibold, design: .rounded))
          Spacer()
        }
        Spacer()
        Text(totalStats.recoveredText)
          .foregroundColor(.white)
          .font(.system(size: 18, weight: .bold, design: .rounded))
      }
      .padding(8)
      .background(Color(#colorLiteral(red: 0.2980392157, green: 0.8509803922, blue: 0.4823529412, alpha: 1)))
      .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 8) {
        HStack {
          Text("Death")
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .semibold, design: .rounded))
          Spacer()
        }
        Spacer()
        Text(totalStats.deathText)
          .foregroundColor(.white)
          .font(.system(size: 18, weight: .bold, design: .rounded))
      }
      .padding(8)
      .background(Color(#colorLiteral(red: 1, green: 0.3490196078, blue: 0.3490196078, alpha: 1)))
      .cornerRadius(8)
      
    }
    .padding(.vertical)
  }
}

struct GlobalStatsView_Previews: PreviewProvider {
  static var previews: some View {
    GlobalStatsView(totalStats: .stub)
  }
}
