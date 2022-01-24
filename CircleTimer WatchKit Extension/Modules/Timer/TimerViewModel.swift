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
    
    var timer: CircleTimer?
    
    @Published var progress: Float
    @Published var timeString: String = ""
    
    private var timerService: TimerServiceProtocol
    private var worker: TimerWorker?
    private var cancellables = Set<AnyCancellable>()
    
    init(appContext: AppContextProtocol) {
        timerService = appContext.timerService
        progress = 0.5
    }
    
    func startTimer() {
        guard let timer = self.timer else { return }
        worker = timerService.raiseWorker(for: timer)
        worker?.stop()
        worker?.$secondsLeft.sink(receiveValue: { [weak self] receivedValue in
            guard let self = self else { return }
            self.timeString = receivedValue.formattedSecondsView
            self.progress = Float(receivedValue / timer.seconds)
        }).store(in: &cancellables)
        
        worker?.start()
    }

}
