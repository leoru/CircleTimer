//
//  TimePickerViewModel.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

struct TimePickerViewModel {
    var hours: Range<Int> {
        return 0..<24
    }
    
    var minutes: Range<Int> {
        return 0..<60
    }
    
    var seconds: Range<Int> {
        return 0..<60
    }
}
