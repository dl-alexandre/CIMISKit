//
//  MonthlyPrecipFetcher.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation

@Observable
public class MonthlyPrecipFetcher {
 public let past30Days = Date.init(timeIntervalSinceNow: -60*60*24*30)
 public let yesterday = Date.init(timeIntervalSinceNow: -60*60*24*1)
 public var isLoading: Bool = false
 public var errorMessage: String? = nil
    
//    let appState = AppState()
 public let service: APIServiceProtocol
    
 public init(service: APIServiceProtocol? = nil) {
  self.service = service ?? APIService()
 }

    @MainActor static func errorState() -> MonthlyPrecipFetcher {
        let fetcher = MonthlyPrecipFetcher()
        fetcher.errorMessage = CIMISError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    @MainActor static func successState() -> MonthlyPrecipFetcher {
        let fetcher = MonthlyPrecipFetcher()
        return fetcher
    }
    
///    @State private var monthlyData = WeatherPrecipModel(cimisData: CimisPrecipData(providers: [PrecipProviders]()))
    
///    func fetchMonthlyData(station: Int) {
///        monthlyPrecipFetcher.isLoading = true
///        monthlyPrecipFetcher.errorMessage = nil
///
///        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: monthlyPrecipFetcher.past30Days))&endDate=\(formatDateString(string: monthlyPrecipFetcher.yesterday))&dataItems=\(appState.precip)")
///
///        monthlyPrecipFetcher.service.fetchWeather(url: endpoint) { [unowned monthlyPrecipFetcher] result in
///
///            DispatchQueue.main.async {
///                monthlyPrecipFetcher.isLoading = false
///                switch result {
///                case .failure(let error): monthlyPrecipFetcher.errorMessage = error.localizedDescription
///                    print("error: ", error)
///                    print(String(describing: endpoint))
///                case .success(let monthlyData):
///                    self.monthlyData = monthlyData
///                    print("--- success with \(monthlyData.cimisData.providers[0].records.count)")
///                }
///            }
///        }
///    }
}
