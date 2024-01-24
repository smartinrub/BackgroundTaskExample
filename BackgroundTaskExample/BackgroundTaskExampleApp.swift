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
            case .background:
                print("App is in background")
                scheduleAppRefresh()
            default: break
            }
        }
        .backgroundTask(.appRefresh("com.sergiomartinrubio.BackgroundTaskExample.refresh")) { // registers task
            // schedule another task to run this task periodically
            scheduleAppRefresh()
            // Perform your periodic task here
            os_log("Handling background task")
        }
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.sergiomartinrubio.BackgroundTaskExample.refresh")
        // Fetch no earlier than 3 seconds from now. This will be the task execution frequency
        request.earliestBeginDate = .now.addingTimeInterval(3)
        try? BGTaskScheduler.shared.submit(request)
    }
}
