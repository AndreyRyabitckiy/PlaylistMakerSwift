struct PlayListUIModel: Identifiable {
    let id: Int
    let name: String
    let image: String
    let countTracks: String
    let tracks: [TrackUIModel]
}

