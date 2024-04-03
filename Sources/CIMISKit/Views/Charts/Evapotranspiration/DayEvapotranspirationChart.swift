//
//  DayEvapotranspirationChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

struct DayEvapotranspirationChart: View {
    let chartValueOne: [HrlyRecord]
//    let chartValueTwo: [HrlyRecord]
//    let chartValueThree: [HrlyRecord]
    let width: CGFloat
    var appState = AppState()
    var domain: [Double] = [0, 0.05]
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
                    Label("Hourly Evapotranspiration (in)", systemImage: "arrow.triangle.2.circlepath.icloud")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        HrlyS1EtoChart(chartValues: chartValueOne, domain: domain, chartForegroundStyleScale: chartForegroundStyleScale).frame(minHeight: 400)
                        //                    HrlyS2EtoChart(chartValues: chartValueTwo, domain: domain, chartForgroundStyleScale: chartForgroundStyleScale).frame(minHeight: 400).foregroundStyle(Color.blue)
                        //                    HrlyS3EtoChart(chartValues: chartValueThree, domain: domain, chartForgroundStyleScale: chartForgroundStyleScale).frame(minHeight: 400).foregroundStyle(Color.red)
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
//    DayEtoChart(chartValueOne: HrlyProviders.SepFirst.cimisData.providers[0].records,/* chartValueTwo: HrlyProviders.SepSecond.cimisData.providers[0].records, chartValueThree: HrlyProviders.SepThird.cimisData.providers[0].records,*/ width: 600, chartForegroundStyleScale: [AppState().startDate: Color.red])
//}

struct HrlyS1EtoChart: View {
    let chartValues: [HrlyRecord]
    let domain: [Double]
    let chartForegroundStyleScale: KeyValuePairs<String, Color>
    
    var body: some View {
        VStack {
            ZStack {
                Chart(chartValues, id: \.id) {
                    LineMark(
                        x: .value("Hour", $0.hour),
                        y: .value("Eto", Double($0.hourlyETo!.value ?? "")!)
                    )
                }
                .chartLegend(position: .trailing, alignment: .top)
                .chartYScale(domain: domain)
                .chartForegroundStyleScale(chartForegroundStyleScale)
            }
            .padding()
            .cornerRadius(10)
        }
        .cornerRadius(10)
        .padding()
    }
}
