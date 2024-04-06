//
//  DayWindDirectionChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

public struct DayWindDirectionChart: View {
    let chartValueOne: [HrlyRecord]
//    let chartValueTwo: [HrlyRecord]
//    let chartValueThree: [HrlyRecord]
    let width: CGFloat
    var appState = AppState()
    var domain: [Int] = [0, 360]
    var chartForegroundStyleScale: KeyValuePairs<String, Color>
//    var chartForgroundStyleScale: KeyValuePairs = ["DayOne": Color.green, "DayTwo": Color.blue, "DayThree": Color.red]
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
 public var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                VStack {
                    Label("Wind Direction (°)", systemImage: "arrow.uturn.up")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        HrlySep1WindDirectionChart(chartValues: chartValueOne, domain: domain, chartForegroundStyleScale: chartForegroundStyleScale).frame(height: 400)
                        //                    HrlySep2WindDirectionChart(chartValues: chartValueTwo, domain: domain, chartForgroundStyleScale: chartForgroundStyleScale).frame(height: 400).foregroundStyle(Color.blue)
                        //                    HrlySep3WindDirectionChart(chartValues: chartValueThree, domain: domain, chartForgroundStyleScale: chartForgroundStyleScale).frame(height: 400).foregroundStyle(Color.red)
                    }
                    .background(.gray.opacity(0.5))
                    .onTapGesture(perform: expand)
                    .cornerRadius(10)
                    .padding()
                }
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
                .padding()
            }.frame(width: (isExpanded ? width : geo.size.width * 0.9))
        }
    }
}

//#Preview {
//    DayWindDirectionChart(chartValueOne: HrlyProviders.SepFirst.cimisData.providers[0].records, /*chartValueTwo: HrlyProviders.SepSecond.cimisData.providers[0].records, chartValueThree: HrlyProviders.SepThird.cimisData.providers[0].records, */width: 600, chartForegroundStyleScale: [AppState().startDate: Color.red])
//}


public struct HrlySep1WindDirectionChart: View {
    let chartValues: [HrlyRecord]
    let domain: [Int]
    let chartForegroundStyleScale: KeyValuePairs<String, Color>
    @State private var selectedIndex: Int?
 public var body: some View {
        ZStack {
            Chart(chartValues, id: \.id) {
                PointMark(
                    x: .value("Hour", $0.hour),
                    y: .value("Wind Direction", Double($0.hourlyWindDirection!.value ?? "")!)
                )
                if let selectedIndex {
                                RuleMark(x: .value("Index", selectedIndex))
                                    .annotation(position: .bottom) {
                                        Text(verbatim: selectedIndex.formatted())
                                            .padding()
                                            .background(.regularMaterial)
                                    }
                            }
            }
            .chartXSelection(value: $selectedIndex)
            .chartLegend(position: .trailing, alignment: .top)
            .chartYScale(domain: domain)
//            .chartXAxis(.hidden)
            .chartForegroundStyleScale(chartForegroundStyleScale)
            .padding()
            .cornerRadius(10)
            
        }
        .cornerRadius(10)
        .padding()
    }
}
