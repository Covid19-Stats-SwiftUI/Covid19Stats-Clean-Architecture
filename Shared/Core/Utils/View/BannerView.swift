//
//  BannerView.swift
//  Covid19Stats
//
//  Created by Ari Supriatna on 07/12/20.
//

import SwiftUI

struct BannerView: View {
  var body: some View {
    VStack {
      Image("banner")
        .resizable()
        .scaledToFit()
    }
  }
}

struct BannerView_Previews: PreviewProvider {
  static var previews: some View {
    BannerView()
  }
}
