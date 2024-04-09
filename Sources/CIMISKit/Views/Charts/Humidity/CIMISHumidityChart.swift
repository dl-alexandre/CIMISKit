//
//  CIMISHumidityChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

public struct CIMISHumidityChart: View {
    @State private var rangeMin: Double = 50
    @State private var rangeMax: Double = 100
    var domain: [Double] = [30, 100]
//    var appState = AppState()
    let chartValues: [Record]
    let width: CGFloat
    var chartForgroundStyleScale: KeyValuePairs = ["Max": Color.blue, "Avg": Color.yellow, "Min": Color.red]
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
 public var body: some View {
        GeometryReader { geo in
        ScrollView(.horizontal) {
            VStack {
                Label("Relative Humidity (%)", systemImage: "water.waves.and.arrow.up")
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                ZStack {
                    Chart(chartValues, id: \.id) {
                        LineMark(
                            x: .value("Date", $0.date),
                            y: .value("Max", Double($0.dailyRelHumMax.value ?? "0")!)
                        ).foregroundStyle(.blue)
                    }
                    .chartLegend(position: .trailing, alignment: .top)
                    .chartForegroundStyleScale(chartForgroundStyleScale)
                    .chartYScale(domain: [rangeMin, rangeMax])
                    Chart(chartValues, id: \.id) {
                        LineMark(
                            x: .value("Date", $0.date),
                            y: .value("Max", Double($0.dailyRelHumAvg.value ?? "80")!)
                        ).foregroundStyle(.yellow)
                    }
                    .chartLegend(position: .trailing, alignment: .top)
                    .chartForegroundStyleScale(chartForgroundStyleScale)
                    .chartYScale(domain: [rangeMin, rangeMax])
                    Chart(chartValues, id: \.id) {
                        LineMark(
                            x: .value("Date", $0.date),
                            y: .value("Max", Double($0.dailyRelHumMin.value ?? "0")!)
                        ).foregroundStyle(.red)
                    }
                    .chartLegend(position: .trailing, alignment: .top)
                    .chartForegroundStyleScale(chartForgroundStyleScale)
                    .chartYScale(domain: [rangeMin, rangeMax])
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
                        rangeMin += 10
                    }
                    Button("Zoom Out") {
                        rangeMin -= 10
                    }
                }
            )
        )
    }
}
}

//#Preview {
//    CIMISHumidityChart(chartValues: Providers.dailyData.cimisData.providers[0].records, width: 500)
//}
