//
//  File.swift
//  
//
//  Created by Dalton Alexandre on 12/21/23.
//

import Foundation

public protocol APIServiceProtocol {
    func fetchStations(
        url: URL?,
        completion: @escaping(Result<StationModel, CIMISError>) -> Void)
    func fetchZips(
        url: URL?,
        completion: @escaping(Result<ZipCodeModel, CIMISError>) -> Void)
    func fetchWeather(
        url: URL?,
        completion: @escaping(Result<WeatherPrecipModel, CIMISError>) -> Void)
    func fetchHourlyWeather(
        url: URL?,
        completion: @escaping(Result<HrlyWeatherModel, CIMISError>) -> Void)
}
