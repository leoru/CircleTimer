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
    
    enum State {
        case active
        case stopped
        case paused
    }

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
    
    var state: State = .stopped
    
    init(seconds: Int, continious: Bool) {
        self.seconds = seconds
        self.continious = continious
        self.secondsLeft = seconds
    }
    
    
    /// Start timer work with counting cycles
    func start() {
        state = .active
        secondsLeft = seconds
        makeTimer()
    }
    
    
    /// Resume time after stopping
    func resume() {
        state = .active
        makeTimer()
    }
    
    /// Completely stop the worker
    func stop() {
        state = .stopped
        
        print("[TIMER_WORKER] stop...")
        timer?.invalidate()
        secondsLeft = 0
    }
    
    /// Pause the worker
    func pause() {
        state = .paused
        
        print("[TIMER_WORKER] pause...")
        timer?.invalidate()
    }
    
    /// Restart after cycle is finished
    private func restart() {
        stop()
        fireSound()
        secondsLeft = seconds
        start()
    }
    
    private func makeTimer() {
        print("[TIMER_WORKER] start...")
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.checkCycle()
        })
    }
    
    /// Checking conditions for current cycle
    private func checkCycle() {
        if secondsLeft == 0 {
            print("[TIMER_WORKER] restart...")
            restart()
            ciclesCount += 1
        } else {
            secondsLeft -= 1
            print("[TIMER_WORKER] progress: \(secondsLeft.formattedSecondsView)")
        }
    }
    
    /// Notify user about cycle ending
    private func fireSound() {
        WKInterfaceDevice.current().play(.notification)
    }

}
