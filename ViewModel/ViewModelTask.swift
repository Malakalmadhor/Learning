//
//  Viewmodel.swift
//  Learning
//
//  Created by Malak on 27/10/2024.
//
import SwiftUI

class ViewModelTask: ObservableObject {
    @Published var currentWeek: [Date] = []
    @Published var currentDate: Date = Date()
    @Published var todayColor: Color = .primary
    @Published var dateColorHistory: [DateColorEntry] = []
    
    private let historyKey = "dateColorHistoryKey"

    init() {
        fetchCurrentWeek()
        loadHistory()  // Load saved history on initialization
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        guard let firstWeekDay = week?.start else { return }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day - 1, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
    
    func setTodayColorToBrown() {
        todayColor = .brown
        saveHistory(for: currentDate, color: todayColor)
    }
    
    func setTodayColorToBlue() {
        todayColor = .blue
        saveHistory(for: currentDate, color: todayColor)
    }
    
    private func saveHistory(for date: Date, color: Color) {
        let entry = DateColorEntry(date: date, color: color)
        dateColorHistory.append(entry)
        saveToUserDefaults()
    }
    
    private func saveToUserDefaults() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(dateColorHistory) {
            UserDefaults.standard.set(encodedData, forKey: historyKey)
        }
    }
    
    private func loadHistory() {
        if let savedData = UserDefaults.standard.data(forKey: historyKey) {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode([DateColorEntry].self, from: savedData) {
                self.dateColorHistory = loadedData
            }
        }
    }
}

struct Views_Preview: PreviewProvider {
    static var previews: some View {
        Views()
    }
}

extension View {
    func hLeading() -> some View {
        self.frame(maxWidth: .infinity, alignment: .leading)
    }
    func hTrailing() -> some View {
        self.frame(maxWidth: .infinity, alignment: .trailing)
    }
    func hCenter() -> some View {
        self.frame(maxWidth: .infinity, alignment: .center)
    }
}
