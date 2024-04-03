//
//  DayHumidityChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

struct DayHumidityChart: View {
    let chartValueOne: [HrlyRecord]
//    let chartValueTwo: [HrlyRecord]
//    let chartValueThree: [HrlyRecord]
    let width: CGFloat
    var appState = AppState()
    var domain: [Int] = [70, 100]
    var chartForegroundStyleScale: KeyValuePairs<String, Color>
//    var chartForgroundStyleScale: KeyValuePairs = ["DayOne": Color.green, "DayTwo": Color.blue, "DayThree": Color.red]
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                VStack {
                    Label("Relative Humidity (%)", systemImage: "water.waves.and.arrow.up")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        HrlySep1HumidityChart(chartValues: chartValueOne, domain: domain, chartForegroundStyleScale: chartForegroundStyleScale).frame(height: 400)
                        //                    HrlySep2HumidityChart(chartValues: chartValueTwo, domain: domain, chartForgroundStyleScale: chartForgroundStyleScale).frame(height: 400).foregroundStyle(Color.blue)
                        //                    HrlySep3HumidityChart(chartValues: chartValueThree, domain: domain, chartForgroundStyleScale: chartForgroundStyleScale).frame(height: 400).foregroundStyle(Color.red)
                    }
                    .background(.gray.opacity(0.5))
                    .onTapGesture(perform: expand)
                    .cornerRadius(10)
                    .padding()
                }
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
                .padding()
                .frame(width: (isExpanded ? width : geo.size.width * 0.9))
            }
        }
    }
}

//#Preview {
//    DayHumidityChart(chartValueOne: HrlyProviders.SepFirst.cimisData.providers[0].records, /*chartValueTwo: HrlyProviders.SepSecond.cimisData.providers[0].records, chartValueThree: HrlyProviders.SepThird.cimisData.providers[0].records,*/ width: 600, chartForegroundStyleScale: [AppState().startDate: Color.red])
//}

struct HrlySep1HumidityChart: View {
    let chartValues: [HrlyRecord]
    let domain: [Int]
    let chartForegroundStyleScale: KeyValuePairs<String, Color>
    
    var body: some View {
        ZStack {
            Chart(chartValues, id: \.id) {
                LineMark(
                    x: .value("Date", $0.hour),
                    y: .value("Soil Temp", Double($0.hourlyRelativeHumidity!.value ?? "")!)
                )
            }
            .chartLegend(position: .trailing, alignment: .top)
            .chartYScale(domain: domain)
            .chartForegroundStyleScale(chartForegroundStyleScale)
            .padding()
            .cornerRadius(10)
        }
        .cornerRadius(10)
        .padding()
    }
}
