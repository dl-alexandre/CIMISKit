//
//  Unit.swift
//
//
//  Created by Dalton Alexandre on 12/15/23.
//

import Foundation

public enum Unit: String, Codable {
    // Temperature
    case Fahrenheit = "(F)"
    case celsius =  "(C)"
    // Length
    case inches = "(in)"
    case centimeters = "(mm)"
    // Percentage
    case percent = "(%)"
    // Surface Power Density
    case LanglyPerDay = "(Ly/day)"//https://en.wikipedia.org/wiki/Langley_(unit)
    case wattPerSquareMeter = "(W/sq.m)"
    // Pressu©℉℉re
    case milliBars = "(mBars)"//https://en.wikipedia.org/wiki/Bar_(unit)
    case kiloPascals =  "(kPa)"
    // Speed
    case milesPerHour = "(MPH)"
    case metersPerSecond = "(m/s)"
}
