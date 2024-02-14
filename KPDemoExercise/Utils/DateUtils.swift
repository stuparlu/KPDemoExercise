//
//  DateUtils.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 14.2.24..
//

import Foundation

struct DateUtils {
    static func dateToAgo(dateText: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = KeyStrings.baseUrl
        var ago = ""
        if let loadedDate = dateFormatter.date(from: dateText) {
            let calendar = Calendar.current
            let currentDate = Date()
            if let days = calendar.dateComponents([.day], from: loadedDate, to: currentDate).day {
                if days == 0 {
                    ago = DisplayStrings.today
                } else if days == 1 {
                    ago = DisplayStrings.yesterday
                } else if days % 10 == 1 {
                    ago = "\(DisplayStrings.before)\(days)\(DisplayStrings.day)"
                } else {
                    ago = "\(DisplayStrings.before)\(days)\(DisplayStrings.days)"
                }
            }
        }
        return ago
    }
}
