//
//  ContentView.swift
//  FastTrack
//
//  Created by Justin on 4/30/23.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 200)),
    ]
    
    @AppStorage("searchText") var searchText = ""
    @State private var audioPlayer: AVPlayer?
    @State private var tracks = [Track]()
    
    
    var body: some View {
        VStack{
            HStack{
                TextField("Search for a song", text: $searchText)
                    .onSubmit(startSearch)
                Button("Search", action: startSearch)
            }
            .padding([.top, .horizontal])
            
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(tracks) { track in
                        TrackView(track: track, onSelected: play)
                        //create clickable button to play the selected track
                        Button{
                            play(track)
                            } label: {
                            ZStack (alignment: .bottom) {
                                AsyncImage(url: track.artworkURL) { phase in
                                    switch phase {
                                    case.success(let image):
                                        image.resizable()
                                    case.failure(_):
                                        Image(systemName: "questionmark")
                                            .symbolVariant(.circle)
                                            .font(.largeTitle)
                                    default:
                                        ProgressView()
                                    }
                                }
                                .frame(width: 150, height: 150)
                                //overlay artist name over track image
                                VStack{
                                    Text(track.trackName)
                                        .font(.headline)
                                    
                                    Text(track.artistName)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(5)
                                .frame(width: 150)
                                .background(.regularMaterial)
                            }
                        }
                            .buttonStyle(.borderless)
                    }
                }
            } //end scroll view
        }
    }
    
    
    func startSearch() {
        Task {
            do {
                try await performSearch()
                } catch {
                    print(error)
            }
        }
    }
    

    
    //“fetch the iTunes API URL with the user’s search text, download the data, convert it into a SearchResult object, then store its results array somewhere”
    func performSearch() async throws {
        guard let searchText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        guard let url = URL(string:"https://itunes.apple.com/search?term=\(searchText)&limit=100&entity=song") else { return }
        let (data, _) = try await URLSession.shared.data(from: url)
        let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        tracks = searchResult.results
    }
    
    func play(_ track: Track){
        audioPlayer?.pause()
        audioPlayer = AVPlayer(url: track.previewUrl)
        audioPlayer?.play()
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

