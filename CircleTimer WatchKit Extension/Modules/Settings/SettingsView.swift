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
        .navigationBarBackButtonHidden(true)
    }
    
    var startButton: some View {
        NavigationLink(destination: viewModel.isTimerCreated ? TimerView() : nil, isActive: $isStart) {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.green)
                    .cornerRadius(20.0)
                    .frame(height: 44.0)
                Text("start".localized)
                    .foregroundColor(Color.black)
                    .onTapGesture {
                        if viewModel.isTimerShouldBeCreated {
                            viewModel.start()
                            isStart.toggle()
                        }
                    }
            }
            
        }.buttonStyle(PlainButtonStyle())
    }
    
    var stopButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundColor(.white)
                    .opacity(0.2)
                    .cornerRadius(20.0)
                    .frame(height: 44.0)
                Text("cancel".localized)
                    .foregroundColor(Color.white)
            }
        })
            .buttonStyle(PlainButtonStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
