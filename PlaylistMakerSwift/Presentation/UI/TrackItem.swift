import SwiftUI

struct TrackItem: View {
    let track: TrackUIModel
    
    var body: some View {
        HStack(spacing: 0){
            if track.albumImageUrl.isEmpty {
                Image(ImageResource.icTrackPlaceholder45)
                    .frame(width: 45, height: 45)
                    .padding(.leading, 12)
                    .padding(.vertical, 8)
            } else {
                AsyncImage(url: URL(string: track.albumImageUrl)) { status in
                    switch status {
                        case .empty: ProgressView()
                        case .success(let image): image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        case .failure: Image(ImageResource.icTrackPlaceholder45)
                        @unknown default: EmptyView()
                    }
                }
                .frame(width: 45, height: 45)
                .padding(.leading, 12)
                .padding(.vertical, 8)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(track.trackName)
                    .foregroundColor(Color.text)
                    .font(.system(size: 16, weight: Font.Weight.regular))
                    .lineLimit(1)
                
                HStack(spacing: 0) {
                    Text(track.groupName)
                        .foregroundColor(Color.grayText)
                        .font(.system(size: 11, weight: Font.Weight.regular))
                        .lineLimit(1)
                    
                    Image(ImageResource.icDot12)
                    
                    Text(track.trackDuration)
                        .foregroundColor(Color.grayText)
                        .font(.system(size: 11, weight: Font.Weight.regular))
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            
            Image(ImageResource.icArrowRight24)
                .padding(.trailing, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.background)
    }
}

#Preview {
    TrackItem(
        track: TrackUIModel(
            id: 1, trackName: "Here Comes The Sun",
            groupName: "The Beatles",
            trackDuration: "4:01",
            albumImageUrl: ""
        )
    )
}

