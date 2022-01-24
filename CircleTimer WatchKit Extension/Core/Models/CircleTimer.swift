//
//  CircleTimer.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

class CircleTimer: Codable, Identifiable {
    var id: String
    var seconds: Int
    var continious: Bool
    
    init(seconds: Int, continious: Bool) {
        self.id = UUID().uuidString
        self.seconds = seconds
        self.continious = continious
    }
}
