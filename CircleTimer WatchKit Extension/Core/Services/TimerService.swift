//
//  TimerService.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

protocol TimerServiceProtocol {
    var currentTimer: CircleTimer? { get set }
    func fetchTimers() -> [CircleTimer]
    func add(timer: CircleTimer)
    func raiseWorker(for timer: CircleTimer) -> TimerWorker
    func destroyWorker(for timer: CircleTimer)
}

class TimerService: TimerServiceProtocol {
    private var repo: TimerRepositoryProtocol
    private var workers = [String: TimerWorker]()
    var currentTimer: CircleTimer?
    
    init(repo: TimerRepositoryProtocol) {
        self.repo = repo
    }
    
    func fetchTimers() -> [CircleTimer] {
        return repo.fetchTimers()
    }
    
    func add(timer: CircleTimer) {
        repo.add(timer: timer)
    }
    
    func raiseWorker(for timer: CircleTimer) -> TimerWorker {
        if let worker = workers[timer.id] {
            return worker
        }
        
        let worker = TimerWorker(seconds: timer.seconds, continious: timer.continious)
        workers[timer.id] = worker
        
        return worker
    }
    
    func destroyWorker(for timer: CircleTimer) {
        workers[timer.id]?.stop()
        workers[timer.id] = nil
    }
    
}
