//
//  SettingsView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject private var viewModel = SettingsViewModel(appContext: AppContext.shared)
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var isStart: Bool = false
    
    var body: some View {
        VStack {
            TimePickerView(hour: $viewModel.hour, minute: $viewModel.minute, second: $viewModel.second)
            Spacer()
            HStack {
                stopButton
                startButton
            }
        }
        .navigationBarHidden(true)
    }
    
    var startButton: some View {
        VStack {
            NavigationLink(destination: TimerView(), isActive: $isStart) { EmptyView().hidden().padding(0) }.hidden().padding(0)
            Button("start".localized) {
                viewModel.start()
                isStart.toggle()
            }.padding(0)
        }
    }
    
    var stopButton: some View {
        Button("cancel".localized) {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
