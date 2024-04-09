//
//  DayPrecipitationChart.swift
//
//
//  Created by Dalton Alexandre on 12/22/23.
//

import SwiftUI
import Charts

///DayPrecipitationChart(
///     chartValueOne: HrlyProviders.SepFirst.cimisData.providers[0].records, /*
///     chartValueTwo: HrlyProviders.SepSecond.cimisData.providers[0].records,
///     chartValueThree: HrlyProviders.SepThird.cimisData.providers[0].records,*/
///     width: 600,
///     chartForegroundStyleScale: [AppState().startDate: Color.red]
/// )

public struct DayPrecipitationChart: View {
    let chartValueOne: [HrlyRecord]
    let width: CGFloat
//    var appState = AppState()
    var domain: [Int] = [0, 4]
    var chartForegroundStyleScale: KeyValuePairs<String, Color>
    
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
 public var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                VStack {
                    Label("Precipitation", systemImage: "cloud.drizzle")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        PrecipitationChart(chartValues: chartValueOne, domain: domain, chartForegroundStyleScale: chartForegroundStyleScale)//.frame(height: 400)
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
//    DayPrecipitationChart(chartValueOne: HrlyProviders.SepFirst.cimisData.providers[0].records, /*chartValueTwo: HrlyProviders.SepSecond.cimisData.providers[0].records, chartValueThree: HrlyProviders.SepThird.cimisData.providers[0].records,*/ width: 600, chartForegroundStyleScale: [AppState().startDate: Color.red])
//}

public struct PrecipitationChart: View {
    let chartValues: [HrlyRecord]
    let domain: [Int]
    let chartForegroundStyleScale: KeyValuePairs<String, Color>
    
    func sumPrecipitation(_ hour: Int) -> Double {
        self.chartValues.filter {
            Calendar.current.component(.hour, from: $0.date) == hour + 1
        }
        .reduce(0) { $0 + Double($1.hourlyPrecipitation!.value!)! }
    }
    
 public var body: some View {
        ZStack {
            Chart(0..<23, id: \.self) { hour in
                let precipitationValue = sumPrecipitation(Int(hour))
                BarMark(
                    x: .value("Date", hour),
                    y: .value("Soil Temp", precipitationValue)
                )
                .annotation(position: .automatic) {
                    if precipitationValue > 0 {
                        Text(String(format: "%.2f in", precipitationValue))
                            .font(.caption)
                    }
                }
                .annotation(position: .bottom) {
                    if precipitationValue > 0 {
                        if hour > 12 {
                            Text("   \(hour - 12) pm")
                                .rotationEffect(.degrees(90))
                                .font(.caption)
                        } else {
                            Text("   \(hour) am")
                                .rotationEffect(.degrees(90))
                                .font(.caption)
                        }
                    }
                }
            }
            .chartXAxisLabel("Inches", position: .leading)
            .chartLegend(position: .trailing, alignment: .top)
            .chartYScale(domain: domain)
            .chartForegroundStyleScale(chartForegroundStyleScale)
            .chartXAxis {
                AxisMarks(values: [0, 6, 12, 18, 24]) {
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
            .padding()
            .cornerRadius(10)
        }
        .cornerRadius(10)
        .padding()
    }
}
