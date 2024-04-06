//
//  CIMISTemperatureChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

public struct CIMISTempChart: View {
    @State private var rangeMin: Int = 20
    @State private var rangeMax: Int = 80
    var domain: [Int] = [20, 80]
    var appState = AppState()
    let chartValues: [SoilRecord]
    let width: CGFloat
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
 public var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                VStack {
                    Label("Soil Temperature", systemImage: "thermometer.medium")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        chartMax
                        chartAvg
                        chartMin
                    }
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
                .padding()
                .frame(width: (isExpanded ? width : geo.size.width * 0.9))
            }.contextMenu(
                ContextMenu(
                    menuItems: {
                        Button("Zoom In") {
                            rangeMax -= 10
                            rangeMin -= 5
                        }
                        Button("Zoom Out") {
                            rangeMax += 10
                            rangeMin += 5
                        }
                        Button("Expand") {
                            isExpanded.toggle()
                        }
                    }
                )
            )
        }
    }
    
    private var chartMax: some View {
        Chart(chartValues, id: \.id) {
            LineMark(
                x: .value("Date", $0.date),
                y: .value("Avg", Double($0.dailySoilTmpMax.value ?? "") ?? Double($0.dailySoilTmpAvg.value ?? "") ?? Double($0.dailySoilTmpMin.value ?? "") ?? 50)
            ).foregroundStyle(.red)
        }
        .chartLegend(position: .trailing, alignment: .top)
        .chartXAxisLabel("Fahrenheit", position: .leading)
        .chartYScale(domain: [rangeMin, rangeMax])
        //.chartForegroundStyleScale(["Max": .red, "Avg": .yellow, "Min": .blue, "Dew Point": .green])
    }
    
    private var chartAvg: some View {
        Chart(chartValues, id: \.id) {
            LineMark(
                x: .value("Date", $0.date),
                y: .value("Avg", Double($0.dailySoilTmpAvg.value ?? "") ?? Double($0.dailySoilTmpMax.value ?? "") ?? Double($0.dailySoilTmpMin.value ?? "") ?? 50)
            ).foregroundStyle(.yellow)
        }
        .chartLegend(position: .trailing, alignment: .top)
        .chartXAxisLabel("Fahrenheit", position: .leading)
        .chartYScale(domain: [rangeMin, rangeMax])
        //.chartForegroundStyleScale(["Max": .red, "Avg": .yellow, "Min": .blue, "Dew Point": .green])
    }
    
    private var chartMin: some View {
        Chart(chartValues, id: \.id) {
            LineMark(
                x: .value("Date", $0.date),
                y: .value("Avg", Double($0.dailySoilTmpMin.value ?? "") ?? Double($0.dailySoilTmpAvg.value ?? "") ?? Double($0.dailySoilTmpMax.value ?? "") ?? 50)
            ).foregroundStyle(.blue)
        }
        .chartLegend(position: .trailing, alignment: .top)
        .chartXAxisLabel("Fahrenheit", position: .leading)
        .chartYScale(domain: [rangeMin, rangeMax])
        //.chartForegroundStyleScale(["Max": .red, "Avg": .yellow, "Min": .blue, "Dew Point": .green])
    }
}

//#Preview {
//    CIMISTempChart(chartValues: SoilProviders.dailyData.cimisData.providers[0].records, width: 500)
//}

