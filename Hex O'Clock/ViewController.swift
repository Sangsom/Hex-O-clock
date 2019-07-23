//
//  ViewController.swift
//  Hex O'Clock
//
//  Created by Rinalds Domanovs on 23/07/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet var clockLabel: UILabel!

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

        clockLabel.text = "\(formattedHour):\(formattedMinute):\(formattedSecond)"
        view.backgroundColor = UIColor.init(hex: "#\(formattedHour)\(formattedMinute)\(formattedSecond)ff")
    }
}

