//
//  DateFormatter.swift
//  MovieBood
//
//  Created by YILDIRIM on 8.04.2023.
//

import Foundation

extension String{
    func transformStringToDate() -> Date {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withFullDate]
//        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: self) else { return Date.now}
        dateFormatter.string(from: date)
        return date
    }
}

extension Date{
    func dateToString(dateFormat: String = "MMM d, yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
