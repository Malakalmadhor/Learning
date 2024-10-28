//
//  Freezed.swift
//  Learning
//
//  Created by Malak on 28/10/2024.
//

import Foundation
import SwiftUI

struct BlueDayView: View {
    var body: some View {
        VStack {
            Text("Today's color is set to Blue!")
                .font(.title)
                .padding()
            Spacer()
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

