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
            CountdownCircleView(progress: $viewModel.progress)
            HStack {
                cancelButton
                Spacer()
                pauseButton
            }
        }
    }
    
    var pauseButton: some View {
        NavigationLink(destination: TimerView()) {
            Text("Start")
        }
    }
    
    var cancelButton: some View {
        NavigationLink(destination: HomeView()) {
            Text("Stop")
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
