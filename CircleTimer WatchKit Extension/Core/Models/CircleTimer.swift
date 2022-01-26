//
//  CircleTimer.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

class CircleTimer: Codable, Identifiable, ObservableObject, Hashable {
    
    /// We need some UID for every timer to store it
    var id: String
    
    /// Total seconds amount
    var seconds: Int
    
    /// Is this timer repeative
    var continious: Bool
    
    var createdDate: Date
    
    init(seconds: Int, continious: Bool) {
        self.id = UUID().uuidString
        self.createdDate = Date()
        self.seconds = seconds
        self.continious = continious
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(seconds)
    }
    
    static func == (lhs: CircleTimer, rhs: CircleTimer) -> Bool {
        lhs.id == rhs.id
    }
}
