//
//  TimerView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct TimerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = TimerViewModel(appContext: AppContext.shared)
    
    var body: some View {
        VStack {
            CountdownCircleView(progress: $viewModel.progress, timeLabel: $viewModel.timeString)
                .padding(EdgeInsets(top: 5.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
            Spacer()
            HStack {
                cancelButton
                Spacer()
                restartButton
                Spacer()
                toggleButton
            }.padding(.top, 5.0)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                viewModel.start()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    var cancelButton: some View {
        Button(action: {
            viewModel.stop()
            presentationMode.wrappedValue.dismiss()
        }) {
            buttonImage(name: "close_icon")
        }
        .buttonStyle(.borderless)
    }
    
    var toggleButton: some View {
        Button(action: {
            viewModel.toggle()
        }) {
            if viewModel.isPaused {
                buttonImage(name: "play_icon")
            } else {
                buttonImage(name: "pause_icon")
            }
        }
        .buttonStyle(.borderless)
    }
    
    var restartButton: some View {
        Button(action: {
            viewModel.restart()
        }) {
            buttonImage(name: "restart_icon")
        }
        .buttonStyle(.borderless)
    }
    
    func buttonImage(name: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22.0)
                .foregroundColor(.white)
                .opacity(0.2)
                .cornerRadius(22.0)
                .frame(width: 44.0, height: 44.0)
            Image(name)
                .resizable()
                .modifier(TimerButtonImageModifier())
                .padding()
        }
    }
}
