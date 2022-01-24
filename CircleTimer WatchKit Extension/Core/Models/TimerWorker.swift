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
    
    /// Should worker work repeatively
    private var continious: Bool
    
    //TODO: add publisher
    
    init(seconds: Int, continious: Bool) {
        self.seconds = seconds
        self.continious = continious
        self.secondsLeft = seconds
    }
    
    func start() {
        secondsLeft = seconds
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.checkCycle()
        })
    }
    
    func stop() {
        timer?.invalidate()
        secondsLeft = 0
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    private func restart() {
        stop()
        fireSound()
        secondsLeft = seconds
        start()
    }
    
    private func checkCycle() {
        if secondsLeft == 0 {
            restart()
        } else {
            secondsLeft -= 1
        }
    }
    
    private func fireSound() {
        WKInterfaceDevice.current().play(.success)
    }

}
