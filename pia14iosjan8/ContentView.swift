//
//  ContentView.swift
//  pia14iosjan8
//
//  Created by BillU on 2026-01-08.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @State var piaconnect = PIAConnect()
    
    func testsave() {
        
        UserDefaults(suiteName: "group.pia14")?.setValue("banan", forKey: "fruit")
        
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(FancyCode().makeNiceText())
            
            FancyBoxView()
            
            if piaconnect.isreachable {
                Text("CONNECTED")
            } else {
                Text("NOT CONNECT")
            }
            Text(piaconnect.messagetext)
            
            Button("SEND") {
                piaconnect.sendMessage(message: "TELEFON")
            }
        }
        .padding()
        .onAppear() {
            piaconnect.startconnect()
        }
    }
}

#Preview {
    ContentView()
}
