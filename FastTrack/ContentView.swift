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
    //“fetch the iTunes API URL with the user’s search text, download the data, convert it into a SearchResult object, then store its results array somewhere”
        func performSearch() async throws {
            guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchText)&limit=100&entity=song") else {return}
            let (data, _) = try await URLSession.shared.data(from:url)
            let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
