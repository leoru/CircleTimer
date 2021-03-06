//
//  TimerService.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import Combine

protocol TimerServiceProtocol {
    var currentTimer: CircleTimer? { get set }
    func timersPublisher() -> AnyPublisher<[CircleTimer], Never>
    func add(timer: CircleTimer)
    func raiseWorker(for timer: CircleTimer) -> TimerWorker
    func destroyWorker(for timer: CircleTimer)
}

class TimerService: TimerServiceProtocol {
    
    private var repo: TimerRepositoryProtocol
    
    /// Timer workers storage by their UID
    private var workers = [String: TimerWorker]()
    
    /// Current timer reference
    var currentTimer: CircleTimer?
    
    init(repo: TimerRepositoryProtocol) {
        self.repo = repo
    }
    
    func timersPublisher() -> AnyPublisher<[CircleTimer], Never> {
        return repo.timersPublisher()
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
        
        log("TIMER_SERVICE", "new worker raised")
        
        return worker
    }
    
    func destroyWorker(for timer: CircleTimer) {
        workers[timer.id]?.stop()
        workers[timer.id] = nil
        
        log("TIMER_SERVICE", "worker is destroyed for timer: \(timer.id)")
    }
    
}
