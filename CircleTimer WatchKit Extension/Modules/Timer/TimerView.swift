//
//  TimerView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct TimerView: View {
    
    @ObservedObject private var viewModel = TimerViewModel(appContext: AppContext.shared)
    
    var body: some View {
        VStack {
            CountdownCircleView(progress: $viewModel.progress, timeLabel: $viewModel.timeString)
                .padding(EdgeInsets(top: 5.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
            HStack {
                cancelButton
                Spacer()
                pauseButton
            }
        }
        .onAppear {
            viewModel.start()
        }
    }
    
    var pauseButton: some View {
        EmptyView()
    }
    
    var cancelButton: some View {
        EmptyView()
    }
}
