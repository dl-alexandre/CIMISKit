//
//  DayTemperatureChart.swift
//  
//
//  Created by Dalton Alexandre on 12/25/23.
//


import SwiftUI
import Charts

struct DayTemperatureChart: View  {
    @State private var rangeMin: Int = 20
    @State private var rangeMax: Int = 80
    var domain: [Int] = [53, 70]
    var appState = AppState()
    let chartValueOne: [HrlyRecord]
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                VStack {
                    Label("Soil Temperature", systemImage: "thermometer.medium")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        chart
                    }
                    .padding()
                    .background(.gray.opacity(0.2))
                    .onTapGesture(perform: expand)
                    .cornerRadius(10)
                }
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
                .padding()
                .frame(width: (isExpanded ? 1100 : geo.size.width * 0.9))
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
                            isExpanded = true
                        }
                    }
                )
            )
        }
    }
    
    private var chart: some View {
        Chart(chartValueOne, id: \.id) {
            LineMark(
                x: .value("Hour", $0.hour),
                y: .value("Soil", Double($0.hourlySoilTemp!.value!)!)
            )//.foregroundStyle(by: .value("Day", $0.date))//.opacity(0.3)
        }
        .chartLegend(position: .trailing, alignment: .top)
        .chartYScale(domain: [rangeMin, rangeMax])
        .chartXAxisLabel("Fahrenheit", position: .leading)
    }
}

//#Preview {
//    DayTemperatureChart(chartValueOne: HrlyProviders.SepFirst.cimisData.providers[0].records)
//}
