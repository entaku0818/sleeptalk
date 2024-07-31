//
//  ContentView.swift
//  sleepTalk
//
//  Created by 遠藤拓弥 on 2024/06/11.
//

import SwiftUI
import ActivityKit

struct ContentView: View {

    init() {
        UITabBar.appearance().backgroundColor = .gray
    }
    var body: some View {
        ZStack {

            TabView {
                SleepView()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("First")
                    }.background(Color.red)

                Text("Second Tab")
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Second")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
