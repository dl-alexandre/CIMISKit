//
//  SwiftUIView.swift
//  
//
//  Created by Dalton Alexandre on 8/30/23.
//

import SwiftUI



struct UnitView: View {
    let unit: Unit
    
    @available(iOS 13.0.0, *)
    var body: some View {
        switch unit {
        case .Fahrenheit:
            return Text("℉")
        case .celsius:
            return Text("℃")
        case .inches:
            return Text("in")
        case .centimeters:
            return Text("㎝")
        case .percent:
            return Text("%")
        case .LanglyPerDay:
            return Text("Ly/day")
        case .wattPerSquareMeter:
            return Text("(W/sq.m)")
        case .milliBars:
            return Text("mBars")
        case .kiloPascals:
            return Text("(kPa)")
        case .milesPerHour:
            return Text("mph")
        case .metersPerSecond:
            return Text("(m/s)")
        }
    }
}
//
//#Preview {
//    if #available(iOS 13.0, *) {
//        VStack {
//            UnitView(unit: .Fahrenheit)
//            UnitView(unit: .celsius)
//            UnitView(unit: .inches)
//            UnitView(unit: .centimeters)
//            UnitView(unit: .percent)
//            UnitView(unit: .LanglyPerDay)
//            UnitView(unit: .milliBars)
//            UnitView(unit: .milesPerHour)
//        }
//    } else {
//        // Fallback on earlier versions
//    }
//}
