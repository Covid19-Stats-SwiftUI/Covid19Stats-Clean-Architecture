//
//  SearchRouter.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import SwiftUI

class SearchRouter {
  
  func makeDetailView(for country: CountryModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(for: country)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    
    return DetailView(presenter: presenter)
  }
  
}
