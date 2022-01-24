//
//  SettingsView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct SettingsView: View {

    @ObservedObject private var viewModel = SettingsViewModel(appContext: AppContext.shared)
    
    @State var isStart: Bool = false
    
    var body: some View {
        VStack {
            TimePickerView(hour: $viewModel.hour, minute: $viewModel.minute, second: $viewModel.second)
            HStack {
                stopButton
                startButton
            }
            Spacer()
        }
    }
    
    var startButton: some View {
        NavigationLink(destination: TimerView(timer: viewModel.createdTimer), isActive: $isStart) {
            Button("Start") {
                viewModel.start()
                isStart.toggle()
            }
        }
    }
    
    var stopButton: some View {
        NavigationLink(destination: HomeView()) {
            Text("Stop")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
