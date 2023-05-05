//
//  Track.swift
//  FastTrack
//
//  Created by Justin on 5/3/23.
//

import Foundation



struct Track: Identifiable, Decodable {
    var id : Int { trackId }
    let trackId: Int
    let artistName: String
    let trackName: String
    let previewUrl: URL
    let artWorkUrl100: String
    
    //string replacement to request a 300 X 300 image
    var artworkURL: URL? {
        let replacedString = artWorkUrl100.replacingOccurrences(of: "100 X 100", with: "300 X 300")
        return URL(string: replacedString)
    }
}

struct SearchResult: Decodable {
    let results: [Track]
}
