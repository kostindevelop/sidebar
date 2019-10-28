//
//  String.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 28.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//

import Foundation

extension String {
    func convertedTimeIntervalToStringDate() -> String {
        let date = Date(timeIntervalSince1970: self as? Double ?? 0)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "dd-MMM-yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
