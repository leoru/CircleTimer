//
//  ContentView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.appContext) var context
    private lazy var viewModel = SettingsViewModel(appContext: context)
    
    var body: some View {
        VStack() {
            ScrollView(.vertical, showsIndicators: false) {
                settingsButton
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
