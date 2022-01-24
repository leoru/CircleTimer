//
//  TimerWorker.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 24.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import WatchKit

class TimerWorker {

    /// Every second timer to countdown
    private var timer: Timer?
    
    /// Total seconds before timer firing
    private var seconds: Int
    
    /// Actual seconds before firing
    @Published private(set) var secondsLeft: Int
    
    /// Count of cycles during timer session
    @Published var ciclesCount: Int = 0
    
    /// Should worker work repeatively
    private var continious: Bool
    
    init(seconds: Int, continious: Bool) {
        self.seconds = seconds
        self.continious = continious
        self.secondsLeft = seconds
    }
    
    
    /// Start timer work with counting cycles
    func start() {
        secondsLeft = seconds
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.checkCycle()
        })
    }
    
    /// Completely stop the worker
    func stop() {
        timer?.invalidate()
        secondsLeft = 0
    }
    
    /// Pause the worker
    func pause() {
        timer?.invalidate()
    }
    
    /// Restart after cycle is finished
    private func restart() {
        stop()
        fireSound()
        secondsLeft = seconds
        start()
    }
    
    /// Checking conditions for current cycle
    private func checkCycle() {
        if secondsLeft == 0 {
            restart()
            ciclesCount += 1
        } else {
            secondsLeft -= 1
        }
    }
    
    /// Notify user about cycle ending
    private func fireSound() {
        WKInterfaceDevice.current().play(.success)
    }

}
