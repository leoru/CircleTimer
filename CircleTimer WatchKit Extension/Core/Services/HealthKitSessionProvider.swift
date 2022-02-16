//
//  HealthKitSessionProvider.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 16.02.2022.
//  Copyright © 2022 Kirill Kunst. All rights reserved.
//

import Foundation
import HealthKit

/// Used for enabling HealthKit session to make timer work when display is off
protocol HealthKitSessionProviderProtocol {
    func start()
    func end()
}

class HealthKitSessionProvider: HealthKitSessionProviderProtocol {
    
    // MARK: - Private
    
    private lazy var healthStore = HKHealthStore()
    
    private lazy var configuration: HKWorkoutConfiguration = {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = .other
        return configuration
    }()
    
    private lazy var session: HKWorkoutSession? = {
        let session = try? HKWorkoutSession(healthStore: healthStore, configuration: configuration)
        return session
    }()
    
    // MARK: - Actions
    
    func start() {
        session?.startActivity(with: Date())
    }
    
    func end() {
        session?.end()
    }
    
}
