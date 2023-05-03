//
//  ContentView.swift
//  FastTrack
//
//  Created by Justin on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    //set grid layout
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 200)),
    ]
    @AppStorage("searchText") var searchText = ""
    
    var body: some View {
        
        VStack{
            HStack{
                TextField("Search for a song", text: $searchText)
                Button("Search"){
                    //more code here
                }
            }
        }
        
        ScrollView (.horizontal, showsIndicators: false){
            LazyHGrid(rows: gridItems) {
                ForEach(1..<100) { i in
                    Color.red
                        .frame(width: 150, height: 150)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
