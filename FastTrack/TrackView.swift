//
//  TrackView.swift
//  FastTrack
//
//  Created by Justin on 5/25/23.
//

import SwiftUI

struct TrackView: View {
        let track: Track
}


struct TrackView_Previews: PreviewProvider {
    static var previews: some View {
        TrackView(track: Track(trackId: 1, artistName: "Nirvana", trackName: "Smells Like Teen Spirit", previewUrl: URL(string: "abc")!, artworkUrl100: "https://bit.ly/teen-spirit"))
    }
}

