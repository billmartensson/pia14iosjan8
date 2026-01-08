//
//  pia14iosjan7widgetLiveActivity.swift
//  pia14iosjan7widget
//
//  Created by BillU on 2026-01-08.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct pia14iosjan7widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct pia14iosjan7widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: pia14iosjan7widgetAttributes.self) { context in
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

extension pia14iosjan7widgetAttributes {
    fileprivate static var preview: pia14iosjan7widgetAttributes {
        pia14iosjan7widgetAttributes(name: "World")
    }
}

extension pia14iosjan7widgetAttributes.ContentState {
    fileprivate static var smiley: pia14iosjan7widgetAttributes.ContentState {
        pia14iosjan7widgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: pia14iosjan7widgetAttributes.ContentState {
         pia14iosjan7widgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: pia14iosjan7widgetAttributes.preview) {
   pia14iosjan7widgetLiveActivity()
} contentStates: {
    pia14iosjan7widgetAttributes.ContentState.smiley
    pia14iosjan7widgetAttributes.ContentState.starEyes
}
