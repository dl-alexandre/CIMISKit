//
//  ZipCodeFetcher.swift
//
//
//  Created by Dalton Alexandre on 12/22/23.
//

import Foundation

@Observable
public class ZipCodeFetcher: ObservableObject {
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    let appState = AppState()
    let service: APIServiceProtocol
    
 public init(service: APIServiceProtocol? = nil) {
  self.service = service ?? APIService()
 }
    
/// @State var zipData = ZipCodeModel(stations: [ZipCode]())

///    func fetchZips() {
///        isLoading = true
///        errorMessage = nil
///
///        let endpoint = URL(string: "https://et.water.ca.gov/api/stationzipcode")
///
///        service.fetchZips(url: endpoint) { [unowned self] result in
///
///            DispatchQueue.main.async {
///                self.isLoading = false
///                switch result {
///                case .failure(let error): self.errorMessage = error.localizedDescription
///                    print("error: ", error)
///                    print(String(describing: endpoint))
///                case .success(let zipData):
///                    self.zipData = zipData
///                    print("--- success with \(zipData.zipCodes.count) stations")
///                }
///            }
///        }
///    }

}

