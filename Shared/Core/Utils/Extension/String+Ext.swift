//
//  String+Ext.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

extension String {
  
  var flag: String {
    let base : UInt32 = 127397
    var s = ""
    for v in unicodeScalars {
      s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return String(s)
  }
  
}
