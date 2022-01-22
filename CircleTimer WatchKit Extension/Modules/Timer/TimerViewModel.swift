//
//  TimerViewModel.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import Foundation
import UIKit

class TimerViewModel: ObservableObject {
    @Published var progress: Float
    
    
    init() {
        progress = 0.5
    }
}
