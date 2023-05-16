//
//  Track.swift
//  FastTrack
//
//  Created by Justin on 5/3/23.
//

import Foundation

struct SearchResult: Decodable {
    let results: [Track]
}

struct Track: Identifiable, Decodable {
    var id : Int { trackId }
    let trackId: Int
    let artistName: String
    let trackName: String
    let previewUrl: URL
    let artworkUrl100: String
    
    //string replacement to request a 300 X 300 image from Itunes rather than the default 100 X 100 image
    var artworkURL: URL? {
        let replacedString = artworkUrl100.replacingOccurrences(of: "100X100", with: "300X300")
        return URL(string: replacedString)
    }
}

