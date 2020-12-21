//
//  NewsView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import SwiftUI

struct NewsView: View {
  
  @ObservedObject var presenter: NewsPresenter
  @StateObject var storeManager: StoreManager
  @State var newsUrl: NewsModel?
  
  var isPurchaseProduct: Bool {
    return UserDefaults.standard.bool(forKey: storeManager.myProducts[0].productIdentifier)
  }
  
  var body: some View {
    ZStack {
      if let news = presenter.news {
        List(isPurchaseProduct ? news : news.suffix(3)) { result in
          NewsRowView(news: result)
            .padding(.vertical, 8)
            .onTapGesture {
              self.newsUrl = result
            }
        }
        .listStyle(InsetGroupedListStyle())
        .sheet(item: self.$newsUrl) { item in
          SafariView(url: URL(string: item.url)!)
        }
        .onOpenURL(perform: { url in
          guard let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems else {
            self.newsUrl = nil
            return
          }
          
          var dict = [String: String]()
          queryItems.forEach { (item) in
            dict[item.name] = item.value
          }
          
          guard let url = dict["url"] else {
            self.newsUrl = nil
            return
          }
          
          self.newsUrl = NewsModel(author: "-", title: "-", description: "-", url: url, urlToImage: "-", content: "-", source: SourceModel(name: "-"))
        })
      } else {
        ProgressView()
      }
    }
    .toolbar(content: {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: !isPurchaseProduct ? { self.storeManager.purchaseProduct(product: storeManager.myProducts[0]) } : {}) {
          Text(!isPurchaseProduct ? "Try Premium" : "")
        }
      }
    })
    .navigationTitle(isPurchaseProduct ? "News Premium" : "News")
    .onAppear {
      self.presenter.getNews()
    }
  }
}
