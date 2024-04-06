//
//  CIMISWindRunChart.swift
//
//
//  Created by Dalton Alexandre on 12/25/23.
//

import SwiftUI
import Charts

public struct CIMISWindRunChart: View {
    @State private var rangeMin: Double = -200
    @State private var rangeMax: Double = 200
    var domain: [Double] = [-200, 200]
    var appState = AppState()
    let chartValues: [Record]
    let width: CGFloat
    @State private var isExpanded = false
    
    func expand() {
        isExpanded.toggle()
    }
    
 public var body: some View {
        GeometryReader { geo in
            ScrollView(.horizontal) {
                VStack {
                    Label("Wind Run (MPH)", systemImage: "wind")
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Chart(chartValues, id: \.id) {
                        LineMark(
                            x: .value("Date", $0.date),
                            y: .value("Max", Double($0.dailyWindRun.value ?? "0")!)
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
                            rangeMax -= 25
                            rangeMin -= 25
                        }
                        Button("Zoom Out") {
                            rangeMax += 25
                            rangeMin += 25
                        }
                    }
                )
            )
        }
    }
}

//#Preview {
//    CIMISWindRunChart(chartValues: Providers.dailyData.cimisData.providers[0].records, width: 500)
//}

