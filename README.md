# BackgroundTaskExample

## Sumulating background task

Testing background tasks in the debugger build is not really possible but we can simulate it.

1. Run the app on your device or simulator.
2. Put a breakpoint somewhere in the app.
3. Move the app to the backgound and back to the foregrond
4. The breakpoint should trigger and the app would pause
5. Run on the debugger console: `e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"com.sergiomartinrubio.BackgroundTaskExample.refresh"]`
6. You should see a log like `Handling background task`.
7. For expiring task: `e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateExpirationForTaskWithIdentifier:@"com.sergiomartinrubio.BackgroundTaskExample.refresh"]`

You may want to test this with a production build in TestFlight.

## Resources

- [Using background tasks to update your app](https://developer.apple.com/documentation/uikit/app_and_environment/scenes/preparing_your_ui_to_run_in_the_background/using_background_tasks_to_update_your_app)

- [Refreshing and Maintaining Your App Using Background Tasks](https://developer.apple.com/documentation/backgroundtasks/refreshing-and-maintaining-your-app-using-background-tasks)
- 