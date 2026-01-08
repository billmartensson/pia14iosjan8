//
//  ContentView.swift
//  pia14iosjan7watch Watch App
//
//  Created by BillU on 2026-01-08.
//

import SwiftUI

struct ContentView: View {
    
    @State var mynumber = 0
    
    @State var piaconnect = PIAConnectWatch()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    if piaconnect.isreachable {
                        Text("CONNECTED")
                    } else {
                        Text("NOT CONNECT")
                    }
                    Text(piaconnect.messagetext)
                    
                    Button("SEND") {
                        piaconnect.sendMessage(message: "KLOCKA")
                    }
                    
                    Text(FancyCode().makeNiceText())
                    Text("\(mynumber)")
                    
                    HStack {
                        Button("MINUS") {
                            mynumber -= 1
                        }
                        Button("PLUS") {
                            mynumber += 1
                        }
                    }
                    
                    NavigationLink(destination: ReadmoreView()) {
                        Text("Go read more")
                    }
                    
                    FancyBoxView()
                }
                .padding()
                .onAppear() {
                    piaconnect.startconnect()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
