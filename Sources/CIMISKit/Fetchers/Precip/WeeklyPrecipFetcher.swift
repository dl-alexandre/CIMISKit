//
//  WeeklyPrecipFetcher.swift
//
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation

@Observable
public class WeeklyPrecipFetcher {
 public var isLoading: Bool = false
 public var errorMessage: String? = nil
    
    let appState = AppState()
 public  let service: APIServiceProtocol
    
 public init(service: APIServiceProtocol? = nil) {
  self.service = service ?? APIService()
 }
    
    @MainActor static func errorState() -> WeeklyPrecipFetcher {
        let fetcher = WeeklyPrecipFetcher()
        fetcher.errorMessage = CIMISError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    @MainActor static func successState() -> WeeklyPrecipFetcher {
        let fetcher = WeeklyPrecipFetcher()
        return fetcher
    }
    
///    @State private var weeklyData = WeatherPrecipModel(cimisData: CimisPrecipData(providers: [PrecipProviders]()))
    
///    func fetchWeeklyData(station: Int) {
///        weeklyPrecipFetcher.isLoading = true
///        weeklyPrecipFetcher.errorMessage = nil
///
///        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: weeklyPrecipFetcher.pastSevenDays))&endDate=\(formatDateString(string: weeklyPrecipFetcher.yesterday))&dataItems=\(appState.precip)")
///
///        weeklyPrecipFetcher.service.fetchWeather(url: endpoint) { [unowned weeklyPrecipFetcher] result in
///
///            DispatchQueue.main.async {
///                weeklyPrecipFetcher.isLoading = false
///                switch result {
///                case .failure(let error): weeklyPrecipFetcher.errorMessage = error.localizedDescription
///                    print("error: ", error)
///                    print(String(describing: endpoint))
///                case .success(let weeklyData):
///                    self.weeklyData = weeklyData
///                    print("--- success with \(weeklyData.cimisData.providers[0].records.count)")
///                }
///            }
///        }
///    }
}
