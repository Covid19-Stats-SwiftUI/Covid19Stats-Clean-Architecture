//
//  NewsMapper.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation

final class NewsMapper {
  
  let defaultImage = "https://ec.europa.eu/programmes/creative-europe/sites/default/files/covid19-cdc-unsplash.jpg"
  
  static func mapNewsResponseToDomains(input news: [News]) -> [NewsModel] {
    return news.map { result in
      
      let source = SourceModel(name: result.source?.name ?? "Unknown")
      
      return NewsModel(
        author: result.author ?? "Unknown",
        title: result.title ?? "",
        description: result.description ?? "",
        url: result.url ?? "",
        urlToImage: result.urlToImage ?? NewsMapper().defaultImage,
        content: result.content ?? "",
        source: source
      )
    }
  }
  
  static func mapNewsResponseToEntities(input newsResponse: [News]) -> [NewsEntity] {
    return newsResponse.map { result in
      let newSource = SourceEntity()
      newSource.name = result.source?.name ?? "Unknown"
      
      let newNews = NewsEntity()
      newNews.title = result.title ?? "Uknown"
      newNews.author = result.author ?? "Unknown"
      newNews.desc = result.description ?? "Unknown"
      newNews.url = result.url ?? ""
      newNews.urlToImage = result.urlToImage ?? NewsMapper().defaultImage
      newNews.content = result.content ?? "Unknown"
      newNews.source = newSource
      
      return newNews
    }
  }
  
  static func mapNewsEntitiesToDomains(input newsEntities: [NewsEntity]) -> [NewsModel] {
    return newsEntities.map { result in
      let source = SourceModel(name: result.source?.name ?? "Unknown")
      
      return NewsModel(
        author: result.author,
        title: result.title,
        description: result.desc,
        url: result.url,
        urlToImage: result.urlToImage,
        content: result.content,
        source: source
      )
    }
  }
  
}
