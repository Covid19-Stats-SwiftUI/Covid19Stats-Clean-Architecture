//
//  CaseStatsView.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 06/12/20.
//

import SwiftUI

struct CaseStatsView: View {
  
  let text: String
  let totalCountText: String
  let color: Color
  var height: CGFloat? = nil
  
  var body: some View {
    VStack {
      Text(text)
        .font(.system(size: 14, weight: .semibold))
      
      Spacer()
      
      Text(totalCountText)
        .font(.system(size: 16, weight: .bold))
    }
    .padding(.vertical)
    .lineLimit(1)
    .minimumScaleFactor(0.7)
    .foregroundColor(.white)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(color)
  }
}
