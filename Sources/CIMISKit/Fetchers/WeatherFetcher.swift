//
//  WeatherFetcher.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation


@MainActor
public class WeatherFetcher: ObservableObject {
    
    @Published public var dailyData = WeatherPrecipModel(cimisData: CimisPrecipData(providers: [PrecipProviders]()))
    @Published public var weeklyData = WeatherPrecipModel(cimisData: CimisPrecipData(providers: [PrecipProviders]()))
    @Published public var monthlyData = WeatherPrecipModel(cimisData: CimisPrecipData(providers: [PrecipProviders]()))
    @Published public var annualData = WeatherPrecipModel(cimisData: CimisPrecipData(providers: [PrecipProviders]()))
    @Published public var hourlyData = HrlyWeatherModel(cimisData: HrlyCimisData(providers: [HrlyProviders]()))
    @Published public var hourlyDataTwo = HrlyWeatherModel(cimisData: HrlyCimisData(providers: [HrlyProviders]()))
    @Published public var hourlyDataThree = HrlyWeatherModel(cimisData: HrlyCimisData(providers: [HrlyProviders]()))
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? = nil
    
    
    
    let appState = AppState()
 public  let service: APIServiceProtocol
//    let precipTotal: Double
    
 public init(service: APIServiceProtocol? = nil) {
  self.service = service ?? APIService()
 }
    
//    static var precipTotal: Double {
//        dailyData.cimisData.providers[0].records.map { $0.dailyPrecip.value ?? 0 }.reduce(0, +)
//    }
    
    func getData(station: Int) {
        //fetchAnnualData(station: station)
        //fetchMonthlyData(station: station)
//        //fetchWeeklyData(station: station)
//        fetchHourlyData(station: station)
//        fetchHourlyDataTwo(station: station)
//        fetchHourlyDataThree(station: station)
        self.isLoading = false
    }
    
    func formatDateString(string: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        let date = formatter.string(from: string)
        return date
    }
    
    func fetchStandardData(station: Int, startDate: String, endDate: String) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(startDate)&endDate=\(endDate)&dataItems=\(appState.precip)")
        
        service.fetchWeather(url: endpoint) { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    self.isLoading = false
                    print(String(describing: endpoint))
                case .success(let dailyData):
                    self.dailyData = dailyData
                    print("--- success with \(dailyData.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    
    let pastSevenDays = Date.init(timeIntervalSinceNow: -60*60*24*7)
    let pastYear = Date.init(timeIntervalSinceNow: -60*60*24*365)
    let past30Days = Date.init(timeIntervalSinceNow: -60*60*24*30)
    let today = Date.init(timeIntervalSinceNow: -60*60*12)
    let yesterday = Date.init(timeIntervalSinceNow: -60*60*24*1)
    let dayBeforeYesterday = Date.init(timeIntervalSinceNow: -60*60*24*2)
    let threeDaysAgo = Date.init(timeIntervalSinceNow: -60*60*24*3)

    func fetchAnnualData(station: Int) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: pastYear))&endDate=\(formatDateString(string: yesterday))&dataItems=\(appState.precip)")
        
        service.fetchWeather(url: endpoint) { [unowned self] result in
            
            DispatchQueue.main.async {
//                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    print(String(describing: endpoint))
                case .success(let annualData):
                    self.annualData = annualData
                    print("--- success with \(annualData.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    func fetchMonthlyData(station: Int) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: past30Days))&endDate=\(formatDateString(string: yesterday))&dataItems=\(appState.precip)")
        
        service.fetchWeather(url: endpoint) { [unowned self] result in
            
            DispatchQueue.main.async {
//                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    print(String(describing: endpoint))
                case .success(let monthlyData):
                    self.monthlyData = monthlyData
                    print("--- success with \(monthlyData.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    func fetchWeeklyData(station: Int) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: pastSevenDays))&endDate=\(formatDateString(string: yesterday))&dataItems=\(appState.precip)")
        
        service.fetchWeather(url: endpoint) { [unowned self] result in
            
            DispatchQueue.main.async {
//                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    print(String(describing: endpoint))
                case .success(let weeklyData):
                    self.weeklyData = weeklyData
                    print("--- success with \(weeklyData.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    func fetchHourlyData(station: Int) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: threeDaysAgo))&endDate=\(formatDateString(string: dayBeforeYesterday))&dataItems=\(appState.hrlyPrecip)")
        
        service.fetchHourlyWeather(url: endpoint) { [unowned self] result in
            DispatchQueue.main.async {
//                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    print(String(describing: endpoint))
                case .success(let hourlyData):
                    self.hourlyData = hourlyData
                    
                    print("--- success with \(hourlyData.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    func fetchHourlyDataTwo(station: Int) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: dayBeforeYesterday))&endDate=\(formatDateString(string: yesterday))&dataItems=\(appState.hrlyPrecip)")
        
        service.fetchHourlyWeather(url: endpoint) { [unowned self] result in
            DispatchQueue.main.async {
//                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    print(String(describing: endpoint))
                case .success(let hourlyDataTwo):
                    self.hourlyDataTwo = hourlyDataTwo
                    
                    print("--- success with \(hourlyDataTwo.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    func fetchHourlyDataThree(station: Int) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(formatDateString(string: yesterday))&endDate=\(formatDateString(string: today))&dataItems=\(appState.hrlyPrecip)")
        
        service.fetchHourlyWeather(url: endpoint) { [unowned self] result in
            DispatchQueue.main.async {
//                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    print(String(describing: endpoint))
                case .success(let hourlyDataThree):
                    self.hourlyDataThree = hourlyDataThree
                    
                    print("--- success with \(hourlyDataThree.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    
    func fetchStandardHourData(station: Int, startDate: String, endDate: String) {
        isLoading = true
        errorMessage = nil
        
        let endpoint = URL(string: "https://et.water.ca.gov/api/data?appKey=\(appState.appKey)&targets=\(station)&startDate=\(startDate)&endDate=\(endDate)&dataItems=\(appState.hrlyPrecip)")
        
        service.fetchHourlyWeather(url: endpoint) { [unowned self] result in
            DispatchQueue.main.async {
//                self.isLoading = false
                switch result {
                case .failure(let error): self.errorMessage = error.localizedDescription
                    print("error: ", error)
                    print(String(describing: endpoint))
                case .success(let hourlyData):
                    self.hourlyData = hourlyData
                    print("--- success with \(hourlyData.cimisData.providers[0].records.count)")
                }
            }
        }
    }
    
    //MARK: preview helpers
    static func errorState() -> WeatherFetcher {
        let fetcher = WeatherFetcher()
        fetcher.errorMessage = CIMISError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> WeatherFetcher {
        let fetcher = WeatherFetcher()
        return fetcher
    }
}
