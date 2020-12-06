//
//  HomeRouter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import SwiftUI

class HomeRouter {
  
  func makeDetailView(for country: CountryModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(for: country)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    
    return DetailView(presenter: presenter)
  }
  
}
