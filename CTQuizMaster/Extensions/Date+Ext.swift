//
//  Date+Ext.swift
//  CTQuizMaster
//
//  Created by Zachary on 22/3/24.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
