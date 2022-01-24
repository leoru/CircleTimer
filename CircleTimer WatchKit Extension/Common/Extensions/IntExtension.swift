//
//  IntExtension.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

extension Int {
    var formattedString: String {
        String(format: "%02d", self)
    }
    
    var secondsToHoursMinutesSeconds: (Int, Int, Int) {
        return (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
    
    var formattedSecondsView: String {
        var components = [String]()
        
        let timeData = secondsToHoursMinutesSeconds
        
        if timeData.0 > 0 {
            components.append(timeData.0.formattedString)
        }
        
        components.append(timeData.1.formattedString)
        components.append(timeData.2.formattedString)
        
        return components.joined(separator: ":")
    }
}
