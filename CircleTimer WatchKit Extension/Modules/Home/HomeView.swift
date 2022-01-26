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
            Text("recent".localized)
            ForEach(viewModel.timers) { timer in
                listItem(for: timer)
            }
        }
        .padding(.top, 10.0)
    }
    
    func listItem(for timer: CircleTimer) -> some View {
        NavigationLink(destination: viewModel.isTimerCreated ? TimerView() : nil, isActive: isActiveLink(for: timer)) {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(.orange)
                    .cornerRadius(10.0)
                    .frame(height: 50.0)
                Text(timer.seconds.formattedSecondsView)
                    .foregroundColor(Color.black)
                    .onTapGesture {
                        viewModel.select(timer: timer)
                        isActiveLink(for: timer).wrappedValue.toggle()
                    }
            }
            
        }.buttonStyle(PlainButtonStyle())
    }
    
    func isActiveLink(for timer: CircleTimer) -> Binding<Bool> {
        return .init(get: { () -> Bool in
            return self.viewModel.activeLinks[timer.id] ?? false
        }) { value in
            self.viewModel.activeLinks[timer.id] = value
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
