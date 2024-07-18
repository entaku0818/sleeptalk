//
//  sleepTalkActivityLiveActivity.swift
//  sleepTalkActivity
//
//  Created by 遠藤拓弥 on 2024/07/18.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct sleepTalkActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct sleepTalkActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: sleepTalkActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension sleepTalkActivityAttributes {
    fileprivate static var preview: sleepTalkActivityAttributes {
        sleepTalkActivityAttributes(name: "World")
    }
}

extension sleepTalkActivityAttributes.ContentState {
    fileprivate static var smiley: sleepTalkActivityAttributes.ContentState {
        sleepTalkActivityAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: sleepTalkActivityAttributes.ContentState {
         sleepTalkActivityAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: sleepTalkActivityAttributes.preview) {
   sleepTalkActivityLiveActivity()
} contentStates: {
    sleepTalkActivityAttributes.ContentState.smiley
    sleepTalkActivityAttributes.ContentState.starEyes
}
