//
//  ViewController.swift
//  Hex O'Clock
//
//  Created by Rinalds Domanovs on 23/07/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

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

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var hourLabel: UILabel!

    // MARK: Properties
    let currentDate = NSDate()
    var hour: Int!
    var minute: Int?
    var second: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Launch timer to refresh every second
        Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(showTime),
            userInfo: nil,
            repeats: true)
    }

    // MARK: Update clock UI
    @objc func showTime() {
        guard let hour = currentDate.hour() as Int? else { return }
        guard let minute = currentDate.minute() as Int? else { return }
        guard let second = currentDate.second() as Int? else { return }

        var newSecond: String

        if second < 10 {
            newSecond = "0\(second)"
        } else {
            newSecond = "\(second)"
        }

        hourLabel.text = "\(hour):\(minute):\(newSecond)"
    }
}

