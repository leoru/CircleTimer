//
//  HomeViewModel.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var timers: [CircleTimer] = [CircleTimer]()
    var activeLinks = [String: Bool]()
    var isTimerCreated: Bool {
        timerService.currentTimer != nil
    }
    
    private var timerService: TimerServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(appContext: AppContextProtocol) {
        timerService = appContext.timerService
        timerService.timersPublisher().assign(to: \.timers, on: self).store(in: &cancellables)
    }
    
    func select(timer: CircleTimer) {
        if let currentTimer = timerService.currentTimer {
            timerService.destroyWorker(for: currentTimer)
        }
        
        timerService.currentTimer = timer
    }
}
