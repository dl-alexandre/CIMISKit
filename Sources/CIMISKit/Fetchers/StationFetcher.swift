//
//  StationFetcher.swift
//
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation
//import Observation
//
//@Observable 
//public class StationFetcher: ObservableObject {
// public var isLoading: Bool = false
// public var errorMessage: String? = nil
//
////    let appState = AppState()
// public let service: APIServiceProtocol
//    
//    public init(service: APIServiceProtocol? = nil) {
//        self.service = service ?? APIService()
//    }
//    
/////    @State var stationData = StationModel(stations: [Station]())
//    
/////    func fetchStations() {
/////        stationFetcher.isLoading = true
/////        stationFetcher.errorMessage = nil
/////
/////        let endpoint = URL(string: "https://et.water.ca.gov/api/station")
/////
/////        stationFetcher.service.fetchStations(url: endpoint) { [unowned stationFetcher] result in
/////
/////            DispatchQueue.main.async {
/////                stationFetcher.isLoading = false
/////                switch result {
/////                case .failure(let error): stationFetcher.errorMessage = error.localizedDescription
/////                    print("error: ", error)
/////                    print(String(describing: endpoint))
/////                case .success(let stationData):
/////                    self.stationData = stationData
/////                    print("--- success with \(stationData.stations.count) stations")
/////                }
/////            }
/////        }
/////    }
//}

@MainActor
public class StationFetcher: ObservableObject {
  //@State let stationArray = []
 @Published public var stations = StationModel(/*id: UUID(), */stations: [Station]())//(id: UUID(), stations: <#T##[Station]#>)
 @Published public var isLoading: Bool = false
 @Published public var errorMessage: String? = nil
 
 public let service: APIServiceProtocol
 
 public init(service: APIServiceProtocol? = nil) {
  self.service = service ?? APIService()
  fetchAllStations()
 }
 
 public static func fetchStations(completion: @escaping (Result<[Station], Error>) -> Void) {
  
   // Create URL
  guard let url = URL(string: "https://et.water.ca.gov/api/station") else {
   completion(.failure(CIMISError.invalidURL))
   return
  }
  
   // Create URL session data task
  URLSession.shared.dataTask(with: url) { data, _, error in
   
   if let error = error {
    completion(.failure(error))
    return
   }
   
   guard let data = data else {
    completion(.failure(CIMISError.invalidData))
    return
   }
   
   do {
     // Parse the JSON data
    let FileData = try JSONDecoder().decode(StationModel.self, from: data)
    completion(.success(FileData.stations))
   } catch {
    completion(.failure(error))
   }
   
  }.resume()
 }
 
 public static func fetchStationsWithContinuation() async throws -> [Station] {
  let stations: [Station] = try await withCheckedThrowingContinuation({ continuation in
   
   fetchStations { result in
    switch result {
     case .success(let stations):
      continuation.resume(returning: stations)
     case .failure(let error):
      continuation.resume(throwing: error)
    }
   }
  })
  return stations
 }
  
 public func fetchStations() {
     isLoading = true
     errorMessage = nil
  
     let endpoint = URL(string: "https://et.water.ca.gov/api/station")
  
     service.fetchStations(url: endpoint) { [unowned self] result in
      DispatchQueue.main.async {
       isLoading = false
       switch result {
        case .failure(let error): self.errorMessage = error.localizedDescription
         print("error: ", error)
         print(String(describing: endpoint))
        case .success(let stations):
         self.stations = stations
         print("--- success with \(stations.stations.count) stations")
       }
      }
     }
    }
 
  //MARK: preview helpers
 
 static func errorState() -> StationFetcher {
  let fetcher = StationFetcher()
  fetcher.errorMessage = CIMISError.url(URLError.init(.notConnectedToInternet)).localizedDescription
  return fetcher
 }
 
 static func successState() -> StationFetcher {
  let fetcher = StationFetcher()
   // fetcher.stations = FileData(/*id: UUID(), */stations: [Station.example1(), Station.example2()])
  
  return fetcher
 }
}

