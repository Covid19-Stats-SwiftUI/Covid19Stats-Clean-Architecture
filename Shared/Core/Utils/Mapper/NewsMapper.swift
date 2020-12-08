//
//  NewsMapper.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation

final class NewsMapper {
  
  static func mapNewsResponseToDomains(input news: [News]) -> [NewsModel] {
    return news.map { result in
      
      let source = SourceModel(name: result.source?.name ?? "Unknown")
      
      return NewsModel(
        author: result.author ?? "Unknown",
        title: result.title ?? "",
        description: result.description ?? "",
        url: result.url ?? "",
        urlToImage: result.urlToImage ?? "https://ec.europa.eu/programmes/creative-europe/sites/default/files/covid19-cdc-unsplash.jpg",
        content: result.content ?? "",
        source: source
      )
    }
  }
  
}
