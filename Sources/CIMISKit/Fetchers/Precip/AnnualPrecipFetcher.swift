//
//  AnnualPrecipFetcher.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation

@Observable
public class AnnualPrecipFetcher {
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    let appState = AppState()
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
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

