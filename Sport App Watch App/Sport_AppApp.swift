//
//  Sport_AppApp.swift
//  Sport App Watch App
//
//  Created by Frédéric ALPHONSE on 11/10/2022.
//

import SwiftUI

@main
struct Sport_App_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView{
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryMetricsView()
            }
            .environmentObject(workoutManager)
        }
        
    }
}
