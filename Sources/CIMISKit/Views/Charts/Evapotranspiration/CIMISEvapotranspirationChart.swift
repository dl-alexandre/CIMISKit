//
//  CIMISEvapotranspirationChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

struct CIMISEvapotranspirationChart: View {
    @State private var rangeMin: Double = 0
    @State private var rangeMax: Double = 0.05
    var domain: [Double] = [0, 0.15]
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
                    Label("Daily Evapotranspiration (in))", systemImage: "arrow.triangle.2.circlepath.icloud")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ZStack {
                        Chart(chartValues, id: \.id) {
                            LineMark(
                                x: .value("Date", $0.date),
                                y: .value("Max", Double($0.dailyAsceEto.value ?? "0")!)
                            ).foregroundStyle(.red)
                        }
                        .chartLegend(position: .trailing, alignment: .top)
                        .chartYScale(domain: [rangeMin, rangeMax])
                    }
                    .padding()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .background(.gray.opacity(0.5))
                .cornerRadius(10).padding()
                .frame(width: (isExpanded ? width : geo.size.width * 0.9))
            }.contextMenu(
                ContextMenu(
                    menuItems: {
                        Button("Zoom In") {
                            rangeMax = 0.05
                        }
                        Button("Zoom Out") {
                            rangeMax = 0.1
                        }
                    }
                )
            )
        }
    }
}

//#Preview {
//    CIMISEtoChart(chartValues: Providers.dailyData.cimisData.providers[0].records, width: 500)
//}
