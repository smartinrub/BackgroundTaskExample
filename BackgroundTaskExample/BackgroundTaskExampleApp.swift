//
//  BackgroundTaskExampleApp.swift
//  BackgroundTaskExample
//
//  Created by Sergio Martin Rubio on 2024-01-24.
//

import SwiftUI
import BackgroundTasks
import os

@main
struct BackgroundTaskExampleApp: App {
    @Environment(\.scenePhase) private var phase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .active:
                print("App is active")
                scheduleAppRefresh()
            default: break
            }
        }
        .backgroundTask(.appRefresh("com.sergiomartinrubio.BackgroundTaskExample.refresh")) { // registers task
            // Perform your periodic task here
            os_log("Handling background task")
        }
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.sergiomartinrubio.BackgroundTaskExample.refresh")
        request.earliestBeginDate = .now.addingTimeInterval(15) // Fetch no earlier than 15 seconds from now
        try? BGTaskScheduler.shared.submit(request)
    }
}
