//
//  Date+GetDayOfWeek.swift
//  
//
//  Created by Furkan Kaynar on 27.02.2020.
//

import Foundation

extension Date {
    func getDayOfWeek() -> Int {
        let number: Int = Calendar.current.component(.weekday, from: self) - 2
        return number < 0 ? 6 : number
    }
}
