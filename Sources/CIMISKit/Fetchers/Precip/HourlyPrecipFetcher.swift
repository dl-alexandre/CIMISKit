//
//  HourlyPrecipFetcher.swift
//
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation

@Observable class HourlyPrecipFetcher {
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    let appState = AppState()
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    @MainActor static func errorState() -> HourlyPrecipFetcher {
        let fetcher = HourlyPrecipFetcher()
        fetcher.errorMessage = CIMISError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    @MainActor static func successState() -> HourlyPrecipFetcher {
        let fetcher = HourlyPrecipFetcher()
        return fetcher
    }
    
     
///    @State private var hourlyData = HrlyWeatherModel(cimisData: HrlyCimisData(providers: [HrlyProviders]()))
    
///    func fetchHourlyData(station: Int) {
///        hourlyPrecipFetcher.isLoading = true
///        hourlyPrecipFetcher.errorMessage = nil
///
///        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: fourDaysAgo))&endDate=\(formatDateString(string: threeDaysAgo))&dataItems=\(appState.hrlyPrecip)")
///
///        hourlyPrecipFetcher.service.fetchHourlyWeather(url: endpoint) { [unowned  hourlyPrecipFetcher] result in
///            DispatchQueue.main.async {
///                hourlyPrecipFetcher.isLoading = false
///                switch result {
///                case .failure(let error): hourlyPrecipFetcher.errorMessage = error.localizedDescription
///                    print("error: ", error)
///                    print(String(describing: endpoint))
///                case .success(let hourlyData):
///                    self.hourlyData = hourlyData
///
///                    print("--- success with \(hourlyData.cimisData.providers[0].records.count)")
///                }
///            }
///        }
///    }
}
