//
//  HomeView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  var width = UIScreen.main.bounds.width
  
  var body: some View {
    ZStack {
      if let global = presenter.globalStats {
        ScrollView {
          VStack(alignment: .leading, spacing: 16) {
            GlobalStatsView(presenter: presenter, totalStats: global)
            
            BannerView()
              .padding(.vertical)
            
            Text("Are you feeling sick?")
              .font(.system(size: 20, weight: .semibold))
            
            Text("If you feel sick with any of covid-19 symptoms please call or SMS us immediately for help.")
              .font(.system(size: 16, weight: .regular))
              .foregroundColor(Color(#colorLiteral(red: 0.3803921569, green: 0.4078431373, blue: 0.5450980392, alpha: 1)))
            
            HStack {
              HStack {
                Image("phone")
                Text("Call Now")
                  .foregroundColor(.white)
              }
              .padding(.all)
              .frame(width: (width / 2) - 24)
              .background(Color.red)
              .cornerRadius(8)
              
              Spacer()
              
              HStack {
                Image("message")
                Text("Send SMS")
                  .foregroundColor(.white)
              }
              .padding(.all)
              .frame(width: (width / 2) - 24)
              .background(Color.blue)
              .cornerRadius(8)
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 24) {
              Text("Prevention")
                .font(.system(size: 20, weight: .semibold))
              
              PreventionView()
            }
            .padding(.vertical)
          }
          .padding(.all)
          .frame(maxWidth: .infinity)
        }
      } else {
        ProgressView()
      }
      
    }
    .navigationTitle("Daily Summary")
    .onAppear {
      self.presenter.getGlobalCaseStats()
    }
  }
}

