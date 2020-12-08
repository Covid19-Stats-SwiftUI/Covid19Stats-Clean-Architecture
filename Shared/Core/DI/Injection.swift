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
  
  func provideDetailGlobalStats(by caseType: Endpoints.CaseType) -> DetailGlobalStatsUseCase {
    let repository = provideRepository()
    
    return DetailGlobalStatsInteractor(repository: repository)
  }
  
  func provideSearch() -> SearchUseCase {
    let repository = provideRepository()
    
    return SearchInteractor(repository: repository)
  }
  
}
