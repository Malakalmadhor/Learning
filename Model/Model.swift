//
//  Model.swift
//  Learning
//
//  Created by Malak on 27/10/2024.
//

import SwiftUI

struct DateColorEntry: Codable, Identifiable {
    let id = UUID()
    let date: Date
    let colorString: String  // Store color as a string

    // Computed property to get Color from colorString
    var color: Color {
        switch colorString {
        case "brown":
            return .brown
        case "blue":
            return .blue
        default:
            return .primary
        }
    }
    
    init(date: Date, color: Color) {
        self.date = date
        self.colorString = DateColorEntry.string(from: color)
    }
    
    private static func string(from color: Color) -> String {
        if color == .brown {
            return "brown"
        } else if color == .blue {
            return "blue"
        }
        return "primary"
    }
}
