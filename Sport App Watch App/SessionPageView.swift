//
//  SessionPageView.swift
//  Sport App Watch App
//
//  Created by Frédéric ALPHONSE on 11/10/2022.
//

import SwiftUI
import WatchKit

struct SessionPageView: View {
    @State private var selection: Tab = .metrics

    enum Tab {
        case controls, metrics, nowPlaying
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ControlsView().tag(Tab.controls)
            MetricsView().tag(Tab.metrics)
            NowPlayingView().tag(Tab.nowPlaying)
        }
    }
}

struct SessionPageView_Previews: PreviewProvider {
    static var previews: some View {
        SessionPageView()
    }
}
