//
//  CircleTimerApp.swift
//  CircleTimer WatchKit Extension
//
//  Created by Kirill Kunst on 22.01.2022.
//

import SwiftUI

@main
struct CircleTimerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "circleTimerCategory")
    }
}
