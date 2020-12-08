//
//  Injection.swift
//  Covid19Stats (iOS)
//
//  Created by Ari Supriatna on 05/12/20.
//

import Foundation

final class Injection: NSObject {
  
  private func provideCovidRepository() -> CovidRepositoryProtocol  {
    let remote: CovidNetworkDataSource = CovidNetworkDataSource.sharedInstance
    
    return CovidRepository.sharedInstance(remote)
  }
  
  private func provideNewsRepository() -> NewsRepositoryProtocol {
    let remote: NewsNetworkDataSource = NewsNetworkDataSource.sharedInstance
    
    return NewsRepository.sharedInstance(remote)
  }
  
  func provideHome() -> HomeUseCase {
    let repository = provideCovidRepository()
    
    return HomeInteractor(repository: repository)
  }
  
  func provideDetail(for country: CountryModel) -> DetailUseCase {
    let repository = provideCovidRepository()
    
    return DetailInteractor(repository: repository, country: country)
  }
  
  func provideDetailGlobalStats(by caseType: CovidEndpoints.CaseType) -> DetailGlobalStatsUseCase {
    let repository = provideCovidRepository()
    
    return DetailGlobalStatsInteractor(repository: repository)
  }
  
  func provideSearch() -> SearchUseCase {
    let repository = provideCovidRepository()
    
    return SearchInteractor(repository: repository)
  }
  
  func provideNews() -> NewsUseCase {
    let repository = provideNewsRepository()
    
    return NewsInteractor(repository: repository)
  }
  
}
