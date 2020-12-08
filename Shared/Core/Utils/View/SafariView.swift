//
//  SafariView.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 08/12/20.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
  
  let url: URL
  
  func makeUIViewController(context: Context) -> some UIViewController {
    return SFSafariViewController(url: url)
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
  
}
