//
//  ContentView.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack() {
            ScrollView(.vertical, showsIndicators: false) {
                settingsButton
            }
            
            Spacer()
        }
        .navigationTitle("Timers")
    }
    
    var settingsButton: some View {
        NavigationLink(destination: SettingsView()) {
            Text("Settings")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
