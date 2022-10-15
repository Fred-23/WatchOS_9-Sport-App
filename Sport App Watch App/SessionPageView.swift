//
//  SessionPageView.swift
//  Sport App Watch App
//
//  Created by Frédéric ALPHONSE on 11/10/2022.
//

import SwiftUI
import WatchKit

struct SessionPageView: View {
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State private var selection: Tab = .metrics
    @EnvironmentObject var workoutManager: WorkoutManager
    enum Tab {
        case controls, metrics, nowPlaying
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ControlsView().tag(Tab.controls)
            MetricsView().tag(Tab.metrics)
            NowPlayingView().tag(Tab.nowPlaying)
        }
        .navigationTitle(workoutManager.selectedWorkout?.name ?? "")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(selection == .nowPlaying)
        .onChange(of: workoutManager.running) { _ in
                displayMetricsView()
            }
        .tabViewStyle(
            PageTabViewStyle(indexDisplayMode: isLuminanceReduced ? .never : .automatic)
        )
        .onChange(of: isLuminanceReduced) { _ in
            displayMetricsView()
        }
        }

        private func displayMetricsView() {
            withAnimation {
                selection = .metrics
            }
        }
    
}

struct SessionPageView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPageView()
    }
}
