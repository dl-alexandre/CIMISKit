//
//  AnnualPrecipFetcher.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation
import SwiftUI

extension View {
 
 func formatDateString(string: Date) -> String {
  let formatter = DateFormatter()
  formatter.dateFormat = "YYYY-MM-dd"
  formatter.locale = Locale(identifier: "en_US")
  let date = formatter.string(from: string)
  return date
 }
 
 
 public func fetchAnnualData(station: Int, apf: AnnualPrecipFetcher, appKey: String) /*-> WeatherPrecipModel*/ {
  apf.isLoading = true
  apf.errorMessage = nil
  
  let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appKey)&targets=\(station)&startDate=\(formatDateString(string: apf.pastYear))&endDate=\(formatDateString(string: apf.yesterday))&dataItems=day-precip")
  
  apf.service.fetchWeather(url: endpoint) { [unowned apf] result in
   
   DispatchQueue.main.async {
    apf.isLoading = false
    switch result {
     case .failure(let error): apf.errorMessage = error.localizedDescription
      print("error: ", error)
      print(String(describing: endpoint))
     case .success(let annualData):
//      return annualData
//      self.annualData = annualData
      print("--- success with \(annualData.cimisData.providers[0].records.count)")
//      self.annualInfo = annualData.cimisData.providers.first!.records
    }
   }
  }
 }
}

@Observable
public class AnnualPrecipFetcher {
 public let yesterday = Date.init(timeIntervalSinceNow: -60*60*24*1)
 public let pastYear = Date.init(timeIntervalSinceNow: -60*60*24*365)
 public var isLoading: Bool = false
 public var errorMessage: String? = nil
    
//    let appState = AppState()
 public let service: APIServiceProtocol
    
 public init(service: APIServiceProtocol? = nil) {
  self.service = service ?? APIService()
 }

    @MainActor static func errorState() -> AnnualPrecipFetcher {
        let fetcher = AnnualPrecipFetcher()
        fetcher.errorMessage = CIMISError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    @MainActor static func successState() -> AnnualPrecipFetcher {
        let fetcher = AnnualPrecipFetcher()
        return fetcher
    }
    
///    @State private var annualData = WeatherPrecipModel(cimisData: CimisPrecipData(providers: [PrecipProviders]()))
    
///    func fetchAnnualData(station: Int) {
///        annualPrecipFetcher.isLoading = true
///        annualPrecipFetcher.errorMessage = nil
///
///        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: annualPrecipFetcher.pastYear))&endDate=\(formatDateString(string: annualPrecipFetcher.yesterday))&dataItems=\(appState.precip)")
///
///        annualPrecipFetcher.service.fetchWeather(url: endpoint) { [unowned annualPrecipFetcher] result in
///
///            DispatchQueue.main.async {
///                annualPrecipFetcher.isLoading = false
///                switch result {
///                case .failure(let error): annualPrecipFetcher.errorMessage = error.localizedDescription
///                    print("error: ", error)
///                    print(String(describing: endpoint))
///                case .success(let annualData):
///                    self.annualData = annualData
///                    print("--- success with \(annualData.cimisData.providers[0].records.count)")
///                }
///            }
///        }
///    }
}

