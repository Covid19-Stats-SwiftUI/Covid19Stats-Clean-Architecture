//
//  NewsModel.swift
//  Covid19StatsWidgetExtension
//
//  Created by Ari Supriatna on 09/12/20.
//

import Foundation

struct NewsResponse: Decodable {
  let articles: [NewsModel]
}

struct NewsModel: Decodable, Hashable {
  static func == (lhs: NewsModel, rhs: NewsModel) -> Bool {
    lhs.author == rhs.author
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(title)
  }

  let author: String?
  let title: String?
  let description: String?
  let url: String?
  let urlToImage: String?
  let content: String?
  let source: Source?
  
}

struct Source: Decodable {
  
  let name: String
  
}

extension NewsModel {
  
  static var stub: NewsModel {
    .init(
      author: "ABC Australia",
      title: "Vaksin COVID-19 yang Mulai Disuntikkan Pekan Ini, Adakah Efek Sampingnya? - detikNews",
      description: "Pekan ini, Inggris akan melaksanakan vaksinasi COVID-19 kepada warganya. Namun, masih banyak pertanyaan seputar vaksin yang hingga kini belum terjawab.",
      url: "https://news.detik.com/abc-australia/d-5286211/vaksin-covid-19-yang-mulai-disuntikkan-pekan-ini-adakah-efek-sampingnya",
      urlToImage: "https://awsimages.detik.net.id/api/wm/2020/12/08/vaksin-covid-19-yang-mulai-disuntikkan-pekan-ini-adakah-efek-sampingnya_169.jpeg?wid=54&w=650&v=1&t=jpeg",
      content: "Canberra - Pekan ini Inggris dijadwalkan akan melaksanakan vaksinasi COVID-19 kepada warganya. Namun, banyak pertanyaan seputar vaksin yang hingga kini belum terjawab.\r\nSementara di Australia sendiri… [+5777 chars]",
      source: Source(name: "Detik.com")
    )
  }
  
}
