//
//  TimerService.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

protocol TimerServiceProtocol {
    func fetchTimers() -> [CircleTimer]
    func add(timer: CircleTimer)
}

class TimerService: TimerServiceProtocol {
    private var repo: TimerRepositoryProtocol
    
    private var workers = [String: TimerWorker]()
    
    init(repo: TimerRepositoryProtocol) {
        self.repo = repo
    }
    
    func fetchTimers() -> [CircleTimer] {
        return []
    }
    
    func add(timer: CircleTimer) {
        
    }
    
    func raiseWorker(for timer: CircleTimer) -> TimerWorker {
        if let worker = workers[timer.id] {
            return worker
        }
        
        let worker = TimerWorker(seconds: timer.seconds, continious: timer.continious)
        workers[timer.id] = worker
        
        return worker
    }
    
}
