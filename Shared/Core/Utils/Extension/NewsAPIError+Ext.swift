//
//  NewsAPIError+Ext.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import Foundation

enum NewsAPIError: Error {
  case invalidURL
  case invalidSerialization
  case badHTTPResponse
  case error(NSError)
  case noData
}
