//
//  DateExtension.swift
//  Hex O'Clock
//
//  Created by Rinalds Domanovs on 23/07/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import Foundation

extension NSDate {
    func hour() -> Int {
        let calendar = Calendar.current
        return calendar.component(.hour, from: Date())
    }

    func minute() -> Int {
        let calendar = Calendar.current
        return calendar.component(.minute, from: Date())
    }

    func second() -> Int {
        let calendar = Calendar.current
        return calendar.component(.second, from: Date())
    }
}
