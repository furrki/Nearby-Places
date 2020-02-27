//
//  Date+GetDayOfWeek.swift
//  
//
//  Created by Furkan Kaynar on 27.02.2020.
//

import Foundation

extension Date {
    func getDayOfWeek() -> Int {
        return Calendar.current.component(.weekday, from: self)
    }
}
