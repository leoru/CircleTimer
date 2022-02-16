//
//  TimerRepository.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import Combine

protocol TimerRepositoryProtocol {
    func timersPublisher() -> AnyPublisher<[CircleTimer], Never>
    func add(timer: CircleTimer)
}

class TimerRepository: TimerRepositoryProtocol {
    
    struct Config {
        static let timersKey = "com.kunst.circletimer.storage.timers"
    }
    
    /// By default, we store all timers directly in the memory
    @Published private var inMemoryTimers: [CircleTimer] = [CircleTimer]()
    
    /// Standard user defaults storage is our basic storage
    private var defaults: UserDefaults = UserDefaults.standard
    
    init() {
        if let timers = try? defaults.get(objectType: [CircleTimer].self, forKey: Config.timersKey) {
            inMemoryTimers = timers
        }
    }
    
    func timersPublisher() -> AnyPublisher<[CircleTimer], Never> {
        return $inMemoryTimers.eraseToAnyPublisher()
    }
    
    func add(timer: CircleTimer) {
        if inMemoryTimers.first(where: { $0.seconds == timer.seconds }) != nil {
            return
        }
        
        inMemoryTimers.append(timer)
        
        try? defaults.set(object: inMemoryTimers, forKey: Config.timersKey)
    }
}
