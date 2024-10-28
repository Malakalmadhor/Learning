//
//  Learned.swift
//  Learning
//
//  Created by Malak on 28/10/2024.
//

import Foundation
import SwiftUI

struct BrownDayView: View {
    var body: some View {
        VStack {
            Text("Today's color is set to Brown!")
                .font(.title)
                .padding()
            Spacer()
        }
        .background(Color.brown)
        .edgesIgnoringSafeArea(.all)
    }
}
