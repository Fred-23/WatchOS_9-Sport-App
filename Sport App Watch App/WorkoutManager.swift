//
//  WorkoutManager.swift
//  Sport App Watch App
//
//  Created by Frédéric ALPHONSE on 11/10/2022.
//

import Foundation
import HealthKit

class WorkoutManager: NSObject, ObservableObject {
    var selectedWorkout: HKWorkoutActivityType?
}
