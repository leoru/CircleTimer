//
//  TimerWorker.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 24.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

class TimerWorker {
    
    private var timer: Timer?
    private var seconds: Int
    private var continious: Bool
    private var secondsLeft: Int = 0
    
    //TODO: add publisher
    
    init(seconds: Int, continious: Bool) {
        self.seconds = seconds
        self.continious = continious
    }
    
    func start() {
        secondsLeft = seconds
        timer = Timer(timeInterval: 1.0, repeats: true, block: { [weak self] _ in
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
        secondsLeft = 0
        start()
    }
    
    private func checkCycle() {
        if secondsLeft == seconds {
            restart()
        } else {
            secondsLeft -= 1
        }
    }
    
    private func fireSound() {
        makeFeedback()
        //TODO: play sound
    }
    
    private func makeFeedback() {
        
    }
}
