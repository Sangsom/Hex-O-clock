//
//  ViewController.swift
//  Hex O'Clock
//
//  Created by Rinalds Domanovs on 23/07/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var clockLabel: UILabel!
    @IBOutlet var hexLabel: UILabel!
    
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

        var formattedSecond: String
        var formattedMinute: String
        var formattedHour: String
        var hexCode: String

        if hour < 10 {
            formattedHour = "0\(hour)"
        } else {
            formattedHour = "\(hour)"
        }

        if minute < 10 {
            formattedMinute = "0\(minute)"
        } else {
            formattedMinute = "\(minute)"
        }

        if second < 10 {
            formattedSecond = "0\(second)"
        } else {
            formattedSecond = "\(second)"
        }

        hexCode = "#\(formattedHour)\(formattedMinute)\(formattedSecond)"

        clockLabel.text = "\(formattedHour):\(formattedMinute):\(formattedSecond)"
        hexLabel.text = hexCode
        view.backgroundColor = UIColor.init(hex: "\(hexCode)ff")
    }
}

