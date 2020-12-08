//
//  PreventionView.swift
//  Covid19Stats
//
//  Created by Ari Supriatna on 07/12/20.
//

import SwiftUI

struct PreventionView: View {
  var body: some View {
    HStack {
      VStack {
        Image("close-contact")
        Text("Avoid close contact")
          .font(.system(size: 16, weight: .medium))
          .multilineTextAlignment(.center)
      }
      .frame(width: 100, height: 140)
      
      Spacer()
      
      VStack {
        Image("clean-hands")
        Text("Clean your hands often")
          .font(.system(size: 16, weight: .medium))
          .multilineTextAlignment(.center)
      }
      .frame(width: 100, height: 140)
      
      Spacer()
      
      VStack {
        Image("wear-face-mask")
        Text("Wear a facemask")
          .font(.system(size: 16, weight: .medium))
          .multilineTextAlignment(.center)
      }
      .frame(width: 100, height: 140)
    }
  }
}

struct PreventionView_Previews: PreviewProvider {
  static var previews: some View {
    PreventionView()
  }
}
