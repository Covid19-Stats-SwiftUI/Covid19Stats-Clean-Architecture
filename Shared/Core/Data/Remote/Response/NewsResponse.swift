//
//  NewsResponse.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation

struct NewsResponse: Decodable {
  let articles: [News]
}

struct News: Decodable {
  
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
