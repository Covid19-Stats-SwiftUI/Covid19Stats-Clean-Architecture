//
//  TitleDateHeaderView.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 06/12/20.
//

import SwiftUI

struct TitleDateHeaderView: View {
  
  let title: String
  let date: Date
  
  var body: some View {
    HStack {
      Text(title)
        .font(.system(size: 16, weight: .semibold))
      Text(date, style: .time)
    }
    .lineLimit(1)
    .minimumScaleFactor(0.7)
  }
  
}
