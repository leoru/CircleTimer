//
//  TimerView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject private var viewModel = TimerViewModel(appContext: AppContext.shared)
    
    init(timer: CircleTimer?) {
        viewModel.timer = timer
    }
    
    var body: some View {
        VStack {
            CountdownCircleView(progress: $viewModel.progress, timeLabel: $viewModel.timeString)
            HStack {
                cancelButton
                Spacer()
                pauseButton
            }
        }
        .onAppear {
            viewModel.startTimer()
        }
    }
    
    var pauseButton: some View {
        EmptyView()
    }
    
    var cancelButton: some View {
        EmptyView()
    }
}
