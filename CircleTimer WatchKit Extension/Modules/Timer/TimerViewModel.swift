//
//  TimerViewModel.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import Foundation
import UIKit
import Combine

class TimerViewModel: ObservableObject {
    
    @Published var timer: CircleTimer?
    @Published var progress: Float = 1.0
    @Published var timeString: String = ""
    
    private var timerService: TimerServiceProtocol
    private var worker: TimerWorker?
    private var cancellables = Set<AnyCancellable>()
    
    init(appContext: AppContextProtocol) {
        timerService = appContext.timerService
    }
    
    func start() {
        self.timer = timerService.currentTimer
        
        guard let timer = self.timer else { return }
        worker = timerService.raiseWorker(for: timer)
        worker?.stop()
        worker?.$secondsLeft.sink(receiveValue: { [weak self] receivedValue in
            guard let self = self else { return }
            self.timeString = receivedValue.formattedSecondsView
            self.progress = Float(Float(receivedValue) / Float(timer.seconds))
        }).store(in: &cancellables)
        
        worker?.start()
    }
    
    func stop() {
        worker?.stop()
        
        guard let timer = self.timer else { return }
        timerService.destroyWorker(for: timer)
    }
    
    func pause() {
        worker?.pause()
    }
    
    func restart() {
        worker?.stop()
        worker?.start()
    }

}
