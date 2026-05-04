import SwiftUI

struct TrackScreen: View {
    let track: TrackUIModel
    
    var body: some View {
        ScrollView(){
            VStack(alignment: .leading, spacing: 0) {
                Image(ImageResource.icBack24)
                    .renderingMode(.template)
                    .foregroundColor(.colorText)
                    .padding(16)
                
                if track.albumImageUrl.isEmpty {
                    Image(ImageResource.icPlaceholder312)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .top
                        )
                        .aspectRatio(1, contentMode: .fill)
                        .padding(24)
                } else {
                    AsyncImage(url: URL(string: track.albumImageUrl)) { status in
                        switch status {
                        case .empty: ProgressView()
                        case .success(let image): image
                                .resizable()
                                .aspectRatio(1, contentMode: .fill)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .top
                                )
                                .padding(24)
                            
                        case .failure:                     Image(ImageResource.icPlaceholder312)
                                .frame(
                                    maxWidth: .infinity,
                                    alignment: .top
                                )
                                .aspectRatio(1, contentMode: .fill)
                                .padding(24)
                        @unknown default: EmptyView()
                        }
                    }
                }
                
                Text("Yesterday (Remastered 2009)")
                    .foregroundColor(Color.colorText)
                    .font(.system(size: 22, weight: Font.Weight.medium))
                    .lineLimit(1)
                    .padding(.horizontal, 24)
                
                Text("Yesterday (Remastered 2009)")
                    .foregroundColor(Color.colorText)
                    .font(.system(size: 14, weight: Font.Weight.medium))
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 12, leading: 24, bottom: 30, trailing: 24))
                
                HStack {
                    Image(ImageResource.icAddPlaylist51)
                    Spacer()
                    Image(ImageResource.icPlay100)
                    Spacer()
                    Image(ImageResource.icAddFavorite51)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
                
                Text("0:30")
                    .foregroundColor(Color.colorText)
                    .font(.system(size: 14, weight: Font.Weight.medium))
                    .lineLimit(1)
                    .padding(EdgeInsets(top: 12, leading: 24, bottom: 30, trailing: 24))
                    .frame(maxWidth: .infinity)
                
                TrackInformation(track: track)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
    }
}

#Preview {
    TrackScreen(
        track: TrackUIModel(
            id: 1,
            trackName: "Here Comes The Sun",
            groupName: "The Beatles",
            trackDuration: "4:01",
            albumImageUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC9rp7Q1Gvn54AY8BcwupfxY5HuazFlaiSJw&s",
            albumName: "Yesterday (Remastered 2009)",
            yearRelease: "1965",
            countryRelease: "Великобритания",
            primaryGenreName: "Rock"
        )
    )
}

