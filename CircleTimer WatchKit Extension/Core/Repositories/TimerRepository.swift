//
//  TimerRepository.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation

protocol TimerRepositoryProtocol {
    func fetchTimers() -> [CircleTimer]
    func add(timer: CircleTimer)
}

class TimerRepository: TimerRepositoryProtocol {
    
    struct Config {
        static let cacheName = "com.kunst.circletimer.storage"
        static let timersKey = "com.kunst.circletimer.storage.timers"
    }
    
    private var inMemoryTimers: [CircleTimer] = [CircleTimer]()
    private var defaults: UserDefaults = UserDefaults.standard
    
    init() {
        inMemoryTimers = try! defaults.get(objectType: [CircleTimer].self, forKey: Config.timersKey) ?? []
    }
    
    func fetchTimers() -> [CircleTimer] {
        return inMemoryTimers
    }
    
    func add(timer: CircleTimer) {
        inMemoryTimers.append(timer)
        try? defaults.set(object: inMemoryTimers, forKey: Config.timersKey)
    }
}
