import SwiftUI

struct MediaLibraryScreen: View {
    var trackList: [TrackUIModel]
    var playLists: [PlayListUIModel]
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Picker("", selection: $selectedTab) {
                Text("Избранные треки").tag(0)
                Text("Плейлисты").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            TabView(selection: $selectedTab) {
                FavoriteTracksTab(trackList: trackList)
                    .tag(0)
                PlaylistsTab(playLists: playLists)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

private struct PlaylistsTab: View {
    var playLists: [PlayListUIModel]
    
    var body: some View {
        VStack(spacing: 0) {
            ButtonPlayListMaker(label: "Новый плейлист") {}
            
            if playLists.isEmpty{
                ListIsEmptyError(label: "Вы не создали  ни одного плейлиста")
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    )
            } else {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                ){
                    ForEach(playLists) { playList in
                        PlayListItem(playList: playList)
                    }
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }
}

private struct FavoriteTracksTab: View {
    var trackList: [TrackUIModel]
    
    var body: some View {
        VStack(spacing: 0) {
            if trackList.isEmpty {
                ListIsEmptyError(label: "Ваша медиатека пуста")
            } else {
                LazyVStack {
                    ForEach(trackList) { list in
                        TrackItem(track: list)
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .top
                )
            }
        }
        .background(Color.colorBackground)
    }
}

#Preview {
    MediaLibraryScreen(
        trackList:[],
        playLists: [
            PlayListUIModel(
                id: 1,
                name: "Best songs 2021",
                image: "https://static.eldorado.ru/promo/src/mem-skebob/img/img1.webp",
                countTracks: "1 трек",
                tracks: []
            ),
            PlayListUIModel(
                id: 2,
                name: "Best songs 2020",
                image: "",
                countTracks: "2 трека",
                tracks: []
            ),
        ]
    )
}
