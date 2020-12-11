//
//  NewsEntity.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 12/12/20.
//

import Foundation
import RealmSwift

class NewsEntity: Object {
  
  @objc dynamic var id = UUID().uuidString
  @objc dynamic var author: String = ""
  @objc dynamic var title: String = ""
  @objc dynamic var desc: String = ""
  @objc dynamic var url: String = ""
  @objc dynamic var urlToImage: String = ""
  @objc dynamic var content: String = ""
  @objc dynamic var source: SourceEntity?
  
  override class func primaryKey() -> String? {
    return "id"
  }
   
}

class SourceEntity: Object {
  
  @objc dynamic var name: String = ""
  
}
