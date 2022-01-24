//
//  SettingsViewModel.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import Foundation

struct SettingsViewModel {
    
    private var timerService: TimerServiceProtocol
    
    init(appContext: AppContextProtocol) {
        timerService = appContext.timerService
    }
    
}
