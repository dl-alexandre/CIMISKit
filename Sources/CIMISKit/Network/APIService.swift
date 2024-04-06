//
//  APIService.swift
//
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation


public struct APIService: APIServiceProtocol {
 public func fetchStations(url: URL?, completion: @escaping (Result<StationModel, CIMISError>) -> Void) {
        guard let url = url else {
            let error = CIMISError.invalidURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(CIMISError.url(error)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(CIMISError.invalidResponse(statusCode: response.statusCode)))
            }
            
            //            DispatchQueue.main.async {
            //                self.isLoading = false
            //            }
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            if let data = data {
                
                do {
                    let stations = try decoder.decode(StationModel.self, from: data)
                    completion(Result.success(stations))
                    
                   // print("--- fetched \(stations)")
                    //                    DispatchQueue.main.async {
                    //                        self.stations = stations
                    //                    }
                } catch {
                    completion(Result.failure(CIMISError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
 public func fetchZips(url: URL?, completion: @escaping (Result<ZipCodeModel, CIMISError>) -> Void) {
        guard let url = url else {
            let error = CIMISError.invalidURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(CIMISError.url(error)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(CIMISError.invalidResponse(statusCode: response.statusCode)))
            }
            
            //            DispatchQueue.main.async {
            //                self.isLoading = false
            //            }
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            if let data = data {
                
                do {
                    let zipCodes = try decoder.decode(ZipCodeModel.self, from: data)
                    completion(Result.success(zipCodes))
                    
                   // print("--- fetched \(stations)")
                    //                    DispatchQueue.main.async {
                    //                        self.stations = stations
                    //                    }
                } catch {
                    completion(Result.failure(CIMISError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
 public func fetchWeather(url: URL?, completion: @escaping (Result<WeatherPrecipModel, CIMISError>) -> Void) {
        guard let url = url else {
            let error = CIMISError.invalidURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(CIMISError.url(error)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(CIMISError.invalidResponse(statusCode: response.statusCode))) // TODO: respond by code
            }
            
            //            DispatchQueue.main.async {
            //                self.isLoading = false
            //            }
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            if let data = data {
                
                do {
                    let dayData = try decoder.decode(WeatherPrecipModel.self, from: data)
                    completion(Result.success(dayData))
                    
                    //print("--- fetched \(dayData)")
                    //                    DispatchQueue.main.async {
                    //                        self.stations = stations
                    //                    }
                } catch {
                    completion(Result.failure(CIMISError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
 public func fetchHourlyWeather(url: URL?, completion: @escaping (Result<HrlyWeatherModel, CIMISError>) -> Void) {
        guard let url = url else {
            let error = CIMISError.invalidURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(CIMISError.url(error)))
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(CIMISError.invalidResponse(statusCode: response.statusCode))) // TODO: respond by code
            }
            
            //            DispatchQueue.main.async {
            //                self.isLoading = false
            //            }
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            if let data = data {
                
                do {
                    let hourlyData = try decoder.decode(HrlyWeatherModel.self, from: data)
                    completion(Result.success(hourlyData))
                    
                    //print("--- fetched \(hourlyData)")
                    //                    DispatchQueue.main.async {
                    //                        self.stations = stations
                    //                    }
                } catch {
                    completion(Result.failure(CIMISError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,CIMISError>) -> Void) {
        
        guard let url = url else {
            let error = CIMISError.invalidURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(CIMISError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(CIMISError.invalidResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                dateFormatter.locale = Locale(identifier: "en_US")
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(CIMISError.parsing(error as? DecodingError)))
                    print(String(describing: error))
                }
            }
        }
        task.resume()
    }
}
