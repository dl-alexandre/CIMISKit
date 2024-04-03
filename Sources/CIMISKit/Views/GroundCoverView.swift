//
//  GroundCoverView.swift
//  CIMISThree
//
//  Created by D on 8/10/23.
//

import SwiftUI

struct GroundCoverView: View {
    let groundCover: GroundCover
    
    @available(iOS 13.0.0, *)
    var body: some View {
        switch groundCover {
        case .alfalfa:
            return Text("☘️")
        case .bare:
            return Text("🍂")
        case .grass:
            return Text("🌱")
        }
    }
}
//
//
//#Preview {
//    if #available(iOS 13.0, *) {
//        VStack {
//            GroundCoverView(groundCover: .alfalfa)
//            GroundCoverView(groundCover: .bare)
//            GroundCoverView(groundCover: .grass)
//        }
//    } else {
//        // Fallback on earlier versions
//    }
//}

