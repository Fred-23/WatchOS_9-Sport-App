//
//  ContentView.swift
//  Sport App Watch App
//
//  Created by Frédéric ALPHONSE on 11/10/2022.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var workoutTypes: [HKWorkoutActivityType] = [.cycling, .running, .walking]

    @State var path = NavigationPath() // stack path

    var body: some View {
        NavigationStack {
            List(workoutTypes) { workoutType in
                NavigationLink(workoutType.name, value: workoutType)
            }
            .navigationDestination(for: HKWorkoutActivityType.self) { workoutType in
                SessionPageView()
            }
        }
            .listStyle(.carousel)
            .navigationBarTitle("Workouts")
            .onAppear {
                workoutManager.requestAuthorization()
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .running:
            return "Run"
        case .cycling:
            return "Bike"
        case .walking:
            return "Walk"
        default:
            return ""
        }
    }
}
