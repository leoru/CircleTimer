//
//  SettingsView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.appContext) var context
    private lazy var viewModel = SettingsViewModel(appContext: context)
    
    var body: some View {
        VStack {
           TimePickerView()
            HStack {
                stopButton
                startButton
            }
            Spacer()
        }
    }
    
    var startButton: some View {
        NavigationLink(destination: TimerView()) {
            Text("Start")
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
