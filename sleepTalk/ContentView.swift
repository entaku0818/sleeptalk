//
//  ContentView.swift
//  sleepTalk
//
//  Created by 遠藤拓弥 on 2024/06/11.
//

import SwiftUI

import SwiftUI


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
}
