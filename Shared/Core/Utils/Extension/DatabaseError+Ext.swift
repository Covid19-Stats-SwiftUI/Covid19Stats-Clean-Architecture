//
//  DatabaseError+Ext.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 12/12/20.
//

import Foundation

enum DatabaseError: LocalizedError {

  case invalidInstance
  case requestFailed
  
  var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }

}
