import SwiftUI

struct TrackInformation: View {
    let track: TrackUIModel
    
    var body: some View {
        VStack(spacing: 0){
            InformationLine(
                label: "Длительность",
                information: track.trackDuration
            )
            if let albumName = track.albumName {
                InformationLine(
                    label: "Альбом",
                    information: albumName
                )
            }
            
            InformationLine(
                label: "Год",
                information: track.yearRelease
            )
            
            InformationLine(
                label: "Жанр",
                information: track.primaryGenreName
            )
            
            InformationLine(
                label: "Страна",
                information: track.countryRelease
            )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct InformationLine: View {
    let label: String
    let information: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(label)
                .foregroundColor(Color.colorTextInformationTrack)
                .font(.system(size: 13, weight: Font.Weight.regular))
                .lineLimit(1)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(information)
                .foregroundColor(Color.colorText)
                .font(.system(size: 13, weight: Font.Weight.regular))
                .lineLimit(1)
                .padding(.trailing, 16)
        }
    }
}

#Preview {
    TrackInformation(
        track: TrackUIModel(
            id: 1,
            trackName: "Here Comes The Sun",
            groupName: "The Beatles",
            trackDuration: "4:01",
            albumImageUrl: "",
            albumName: "Yesterday (Remastered 2009)",
            yearRelease: "1965",
            countryRelease: "Великобритания",
            primaryGenreName: "Rock"
        )
    )
}
