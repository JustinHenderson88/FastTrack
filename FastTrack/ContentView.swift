//
//  ContentView.swift
//  FastTrack
//
//  Created by Justin on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        let gridItems: [GridItem] = [
//            GridItem(.fixed(100)),
//            GridItem(.fixed(100)),
//            GridItem(.fixed(100))
//        ]
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
