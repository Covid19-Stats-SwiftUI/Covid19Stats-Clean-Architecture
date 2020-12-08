//
//  NewsView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import SwiftUI

struct NewsView: View {
  
  @ObservedObject var presenter: NewsPresenter
  @State var isShowSafari: Bool = false
  @State var newsUrl: String = "https://google.com"
  
  var body: some View {
    ZStack {
      if let news = presenter.news {
        List(news) { result in
          NewsRowView(news: result)
            .padding(.vertical, 8)
            .onTapGesture {
              self.isShowSafari = true
              self.newsUrl = result.url
            }
        }
        .listStyle(InsetGroupedListStyle())
        .sheet(isPresented: $isShowSafari) {
          SafariView(url: URL(string: self.newsUrl)!)
        }
      } else {
        ProgressView()
      }
    }
    .navigationTitle("News")
    .onAppear {
      self.presenter.getNews()
    }
  }
}
