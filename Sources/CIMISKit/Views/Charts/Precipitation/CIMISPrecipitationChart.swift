//
//  CIMISPrecipitationChart.swift
//  
//
//  Created by Dalton Alexandre on 12/22/23.
//

import SwiftUI
import Charts

/// CIMISPrecipitationChart(
///     chartValues: Providers.dailyData.cimisData.providers[0].records,
///     width: 500
/// )

struct CIMISPrecipitationChart: View {
    @State private var rangeMin: Double = 0
    @State private var rangeMax: Double = 3.5
    
//    var domain: [Double] = [0, 1.5]
    var appState = AppState()
    let chartValues: [PrecipRecord]
    let width: CGFloat
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
//    @Binding var rawSelectedDate: Date?
//    var selectedDate: Date? {
//        guard let rawSelectedDate else { return nil }
//        return chartValues.first?.dailyPrecip(where: {
//          let endOfDay = endOfDay(for: $0.day)
//          return ($0.day ... endOfDay).contains(rawSelectedDate)
//        })?.day
//      }

    
//    func sumPrecipitation(_ day: Int) -> Double {
//      self.chartValues.filter {
//          Calendar.current.component(.day, from: $0.date) == day + 1
//      }
//      .reduce(0) { $0 + Double($1.dailyPrecip.value)! }
//    }
  //  @Binding var rawSelectedDate: Date?
    @State var selectedDate: Date?
    var body: some View {
        GeometryReader { geo in
//            ScrollView(.horizontal) {
                VStack {
//                    Button {
//                        print("\(String(describing: rawSelectedDate))")
//                    } label: {
//                        Text("Print Date")
//                    }
                    Label("Daily Precipitation (in)", systemImage: "cloud.rain.fill")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Chart(chartValues, id: \.id) {
                        day in
                        BarMark(
                            x: .value("Date", day.date, unit: .day),
                            y: .value("Max", Double(day.dailyPrecip.value ?? "") ?? 0)
                        )
                        .foregroundStyle(.blue)
                        
//                        .annotation(position: .trailing) {
//                          Text(String(format: "%.2f in", Double(day.dailyPrecip.value ?? "") ?? 0))
//                            .font(.caption)
//                        }
                        if let selectedDate {
                            RuleMark(
                                  x: .value("Selected", selectedDate, unit: .day)
                                )
                                .foregroundStyle(Color.gray.opacity(0.3))
                                .offset(yStart: -10)
                                .zIndex(-1)
                        }
                    }
                    
//                    .chartOverlay { (chartProxy: ChartProxy) in
//                        Color.clear
//                            .onCont
//                    }
                    .chartScrollableAxes(.horizontal)
                //    .chartXSelection(value: $rawSelectedDate)
                    .chartLegend(position: .trailing, alignment: .top)
                    .chartYScale(domain: [rangeMin, rangeMax])
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .background(.gray.opacity(0.5))
                .cornerRadius(10)
                .padding()
                .frame(width: (isExpanded ? width : geo.size.width * 0.9))
            }
//        .contextMenu(
//                ContextMenu(
//                    menuItems: {
//                        Button("Zoom In") {
//                            rangeMax -= 0.25
//                        }
//                        Button("Zoom Out") {
//                            rangeMax += 0.25
//                        }
//                    }
//                )
//            )
//        }
//        Chart(chartValues, id: \.id) { day in
//            SectorMark(
//              angle: .value("Precipitation", Double(day.dailyPrecip.value ?? "") ?? 0)
//            )
//            .foregroundStyle(by: .value("Month", day.date))
//          }
    }
}

//#Preview {
//    CIMISPrecipitationChart(chartValues: Providers.dailyData.cimisData.providers[0].records, width: 500)
//}
