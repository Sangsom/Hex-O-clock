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

    @IBOutlet var hourLabel: UILabel!

    let currentDate = NSDate()
    var hour: Int!
    var minute: Int?
    var second: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showTime()
    }

    func showTime() {
        hour = currentDate.hour()
        guard let hour = currentDate.hour() as Int? else { return }
        guard let minute = currentDate.minute() as Int? else { return }
        guard let second = currentDate.second() as Int? else { return }

        hourLabel.text = "\(hour):\(minute):\(second)"
    }
}

