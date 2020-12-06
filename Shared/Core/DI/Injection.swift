//
//  Injection.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

final class Injection: NSObject {
  
  private func provideRepository() -> CovidRepositoryProtocol {
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return CovidRepository.sharedInstance(remote)
  }
  
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    
    return HomeInteractor(repository: repository)
  }
  
  func provideDetail(for country: CountryModel) -> DetailUseCase {
    let repository = provideRepository()
    
    return DetailInteractor(repository: repository, country: country)
  }
  
}
