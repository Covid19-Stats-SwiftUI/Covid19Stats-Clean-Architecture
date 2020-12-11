//
//  IntentHandler.swift
//  Covid19StatsIntentExtension
//
//  Created by Ari Supriatna on 10/12/20.
//

import Intents

class IntentHandler: INExtension, SelectCountryIntentHandling {
  
  func provideCountryOptionsCollection(for intent: SelectCountryIntent, with completion: @escaping (INObjectCollection<CountryParam>?, Error?) -> Void) {
    RemoteDataSource.sharedInstance.getAllCountries { (result) in
      switch result {
      case .success(let countries):
        let countryParams = countries.countries.map { CountryParam(country: $0) }
        completion(
          INObjectCollection(sections: [
            INObjectSection(title: "Global", items: [CountryParam.global]),
            INObjectSection(title: "Countries", items: countryParams)
          ]), nil
        )
      case .failure:
        completion(
          INObjectCollection(sections: [
            INObjectSection(title: "Global", items: [CountryParam.global]),
            INObjectSection(title: "Countries", items: [])
          ]), nil
        )
      }
    }
  }

  override func handler(for intent: INIntent) -> Any {
    return self
  }
  
}
