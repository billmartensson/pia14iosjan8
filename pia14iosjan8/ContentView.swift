//
//  ContentView.swift
//  pia14iosjan8
//
//  Created by BillU on 2026-01-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(FancyCode().makeNiceText())
            
            FancyBoxView()
            FancyBoxView()
            FancyBoxView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
