//
//  AppContext.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 23.01.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Env key

private struct AppContextKey: EnvironmentKey {
    static let defaultValue: AppContextProtocol = AppContext.shared
}

extension EnvironmentValues {
    var appContext: AppContextProtocol {
    get { self[AppContextKey.self] }
    set { self[AppContextKey.self] = newValue }
  }
}

// MARK: - Providers

protocol TimerServiceProvider {
    var timerService: TimerService { get }
}

// MARK: - AppContextProtocol

typealias AppContextProtocol = TimerServiceProvider

// MARK: - AppContext

struct AppContext: AppContextProtocol {
    
    var timerService: TimerService
    
    static let shared: AppContext = {
        let timerRepo = TimerRepository()
        let timerService = TimerService(repo: timerRepo)
        return AppContext(timerService: timerService)
    }()
    
}
