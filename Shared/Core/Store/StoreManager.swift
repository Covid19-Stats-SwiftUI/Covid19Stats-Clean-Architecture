//
//  StoreManager.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 13/12/20.
//

import Foundation
import StoreKit

class StoreManager: NSObject, ObservableObject {
  
  @Published var myProducts = [SKProduct]()
  @Published var transactionState: SKPaymentTransactionState?
  
  func getProducts(productIDs: [String]) {
    let request = SKProductsRequest(productIdentifiers: Set(productIDs))
    request.delegate = self
    request.start()
  }
  
  func purchaseProduct(product: SKProduct) {
    if SKPaymentQueue.canMakePayments() {
      let payment = SKPayment(product: product)
      SKPaymentQueue.default().add(payment)
    } else {
      print("User can't make payment.")
    }
  }
  
}

extension StoreManager: SKProductsRequestDelegate, SKRequestDelegate, SKPaymentTransactionObserver {
  func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
    if !response.products.isEmpty {
      for product in response.products {
        DispatchQueue.main.async {
          self.myProducts.append(product)
        }
      }
    }
    
    for invalidIdentifier in response.invalidProductIdentifiers {
      print("Invalid identifiers found: \(invalidIdentifier)")
    }
  }
  
  func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
    for transaction in transactions {
      switch transaction.transactionState {
      case .purchasing:
        print("Purchasing....")
        transactionState = .purchasing
      case .purchased:
        print("Purchased....")
        UserDefaults.standard.setValue(true, forKey: transaction.payment.productIdentifier)
        queue.finishTransaction(transaction)
        transactionState = .purchased
      case .restored:
        print("Restored....")
        UserDefaults.standard.setValue(true, forKey: transaction.payment.productIdentifier)
        queue.finishTransaction(transaction)
        transactionState = .restored
      case .failed, .deferred:
        print("Failed....")
        debugPrint("Payment Queue Error: \(String(describing: transaction.error))")
        queue.finishTransaction(transaction)
        transactionState = .failed
      default:
        queue.finishTransaction(transaction)
      }
    }
  }
  
  func restoreProduct() {
    print("Restoring product....")
    SKPaymentQueue.default().restoreCompletedTransactions()
  }
  
  func requestDidFinish(_ request: SKRequest) {
    DispatchQueue.main.async {
      print("Request Did Finish")
    }
  }
  
  func request(_ request: SKRequest, didFailWithError error: Error) {
    print("didFailWithError =>", error)
    DispatchQueue.main.async {
      print("Purchase Invalid")
    }
  }
  
}
