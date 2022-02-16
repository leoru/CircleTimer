//
//  TimerWorker.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 24.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import WatchKit
import HealthKit

class TimerWorker {
    
    enum State {
        case active
        case stopped
        case paused
    }
    
    /// Represents current state of worker
    var state: State = .stopped
    
    /// Every second timer to countdown
    private var timer: Timer?
    
    /// Total seconds before timer firing
    private var seconds: Int
    
    /// Actual seconds before firing
    @Published private(set) var secondsLeft: Int
    
    /// Count of cycles during timer session
    @Published var cyclesCount: Int = 0
    
    /// Should worker work repeatively
    private var continious: Bool
    
    /// Support background working with healthkit session enabled
    private var sessionProvider: HealthKitSessionProviderProtocol
    
    init(seconds: Int,
         continious: Bool,
         sessionProvider: HealthKitSessionProviderProtocol = HealthKitSessionProvider()) {
        self.seconds = seconds
        self.continious = continious
        self.secondsLeft = seconds
        self.sessionProvider = sessionProvider
        
        sessionProvider.start()
    }
    
    deinit {
        sessionProvider.end()
    }
    
    // MARK: - Public methods
    
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
        
        log("TIMER_WORKER", "stop...")
        
        timer?.invalidate()
        secondsLeft = 0
    }
    
    /// Pause the worker
    func pause() {
        state = .paused
        
        log("TIMER_WORKER", "pause...")
        
        timer?.invalidate()
    }
    
    // MARK: - Private methods
    
    /// Restart after cycle is finished
    private func restart() {
        stop()
        playNotification()
        secondsLeft = seconds
        start()
    }
    
    // Create scheduled system timer
    private func makeTimer() {
        log("TIMER_WORKER", "start...")

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.checkCycle()
        })
    }
    
    /// Check conditions for current cycle
    private func checkCycle() {
        if secondsLeft == 0 {
            restart()
            cyclesCount += 1
        } else {
            secondsLeft -= 1
            log("TIMER_WORKER", "progress: \(secondsLeft.formattedSecondsView)")
        }
    }
    
    /// Notify user about cycle ending
    private func playNotification() {
        WKInterfaceDevice.current().play(.notification)
    }
    
}
