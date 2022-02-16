//
//  ContentView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel(appContext: AppContext.shared)
    
    var body: some View {
        VStack() {
            ScrollView(.vertical, showsIndicators: false) {
                settingsButton
                timersList
            }
            
            Spacer()
        }
        .navigationTitle("timers".localized)
    }
    
    var settingsButton: some View {
        NavigationLink(destination: SettingsView()) {
            Text("settings".localized)
        }
    }
    
    var timersList: some View {
        VStack {
            if viewModel.timers.count > 0 {
                Text("recent".localized)
            }
            ForEach(viewModel.timers) { timer in
                listItem(for: timer)
            }
        }
        .padding(.top, 10.0)
    }
    
    func listItem(for timer: CircleTimer) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.orange)
                .cornerRadius(10.0)
                .frame(height: 50.0)
            Text(timer.seconds.formattedSecondsView)
                .foregroundColor(Color.black)
                
        }
        .onTapGesture {
            viewModel.select(timer: timer)
        }
        .background(NavigationLink(destination: viewModel.isTimerCreated ? TimerView() : nil, tag: timer,
                                   selection: $viewModel.selectedTimer) { EmptyView() }
                                   .buttonStyle(PlainButtonStyle()))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
