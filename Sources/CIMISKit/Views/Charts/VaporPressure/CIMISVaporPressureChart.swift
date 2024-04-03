//
//  CIMISVaporPressureChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

struct CIMISVaporPressureChart: View {
    @State private var rangeMin: Int = 0
    @State private var rangeMax: Int = 20
    var domain: [Int] = [0, 20]
    var appState = AppState()
    let chartValues: [Record]
    let width: CGFloat
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                VStack {
                    Label("Vapor Pressure (mBars)", systemImage: "rectangle.compress.vertical")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Chart(chartValues, id: \.id) {
                        LineMark(
                            x: .value("Date", $0.date),
                            y: .value("Max", Double($0.dailyVaporPressureAvg.value ?? "0")!)
                        ).foregroundStyle(.red)
                    }
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
            }.contextMenu(
                ContextMenu(
                    menuItems: {
                        Button("Zoom In") {
                            rangeMax -= 2
                        }
                        Button("Zoom Out") {
                            rangeMax += 2
                        }
                    }
                )
            )
        }
    }
}

//#Preview {
//    CIMISVaporPressureChart(chartValues: Providers.dailyData.cimisData.providers[0].records, width: 500)
//}
