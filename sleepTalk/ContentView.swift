//
//  ContentView.swift
//  sleepTalk
//
//  Created by 遠藤拓弥 on 2024/06/11.
//

import SwiftUI
import ActivityKit



struct ContentView: View {
    @StateObject private var audioRecorder = AudioRecorder()

    var body: some View {
        VStack {
            Button(action: {
                if audioRecorder.isRecording {
                    audioRecorder.stopRecording()
                } else {
                    audioRecorder.startRecording()
                }
            }) {
                Text(audioRecorder.isRecording ? "録音停止" : "録音開始")
            }
        }
    }
    func startLiveActivity() {
        let attributes = sleepTalkActivityAttributes(name: "Sleep Talk")
        let initialContentState = sleepTalkActivityAttributes.ContentState(emoji: "😴")
        let activityContent = ActivityContent(state: initialContentState, staleDate: Date().addingTimeInterval(60))

        do {
            let activity = try Activity<sleepTalkActivityAttributes>.request(attributes: attributes, content: activityContent, pushType: nil)
            print("Activity started: \(activity.id)")
        } catch {
            print("Failed to start activity: \(error.localizedDescription)")
        }
    }
}
