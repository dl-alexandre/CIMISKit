//
//  StationFetcher.swift
//
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation


@Observable 
public class StationFetcher: ObservableObject {
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    let appState = AppState()
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
///    @State var stationData = StationModel(stations: [Station]())
    
///    func fetchStations() {
///        stationFetcher.isLoading = true
///        stationFetcher.errorMessage = nil
///
///        let endpoint = URL(string: "https://et.water.ca.gov/api/station")
///
///        stationFetcher.service.fetchStations(url: endpoint) { [unowned stationFetcher] result in
///
///            DispatchQueue.main.async {
///                stationFetcher.isLoading = false
///                switch result {
///                case .failure(let error): stationFetcher.errorMessage = error.localizedDescription
///                    print("error: ", error)
///                    print(String(describing: endpoint))
///                case .success(let stationData):
///                    self.stationData = stationData
///                    print("--- success with \(stationData.stations.count) stations")
///                }
///            }
///        }
///    }
}
