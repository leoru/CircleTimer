//
//  SettingsViewModel.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    var createdTimer: CircleTimer?
    @Published var hour: Int = 0
    @Published var minute: Int = 0
    @Published var second: Int = 0
    
    private var totalSeconds: Int {
        return (hour * 60 * 60) + (minute * 60) + second
    }
    
    private var timerService: TimerServiceProtocol
    
    init(appContext: AppContextProtocol) {
        timerService = appContext.timerService
    }
    
    func start() {
        let timer = CircleTimer(seconds: totalSeconds, continious: true)
        timerService.add(timer: timer)
        createdTimer = timer
    }
    
    
}
