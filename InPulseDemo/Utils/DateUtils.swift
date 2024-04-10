//
//  DateUtils.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import Foundation

class DateUtils {

    static let DATE_FORMAT = "yyyy/MM/dd"
    static let DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let DATE_API_FORMAT = "yyyy-MM-dd"
    static let TIME_FORMAT = "HH:mm"
    static let DATE_TIME_FORMAT_NOTI = "yyyy/MM/dd HH:mm"
    static let DATE_SHORT_MONTH_FORMAT = "MMM d, yyyy"

    static func dateToStr(format: String, date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: date)
        return dateString
    }

    static func strToDate(format: String, stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: stringDate) else {
            return Date()
        }
        return date
    }

    static func getDateFormatStandard() -> DateFormatter {
        return getDateFormatter(format: DATE_FORMAT)
    }

    static func getDateFormatter(format: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter
    }

    static func getDateTimeFormat() -> DateFormatter {
        return getDateFormatter(format: DATE_TIME_FORMAT)
    }

    static func getDateAPIFormat() -> DateFormatter {
        return getDateFormatter(format: DATE_API_FORMAT)
    }
}
