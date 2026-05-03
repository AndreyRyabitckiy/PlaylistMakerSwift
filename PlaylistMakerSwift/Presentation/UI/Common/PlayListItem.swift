import SwiftUI

struct PlayListItem: View {
    let playList: PlayListUIModel
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            if playList.image.isEmpty {
                Image(ImageResource.icPlaceholder104)
                    .frame(
                        maxWidth: 160,
                        maxHeight: 160,
                        alignment: .center
                    )
            } else {
                AsyncImage(url: URL(string: playList.image)) { status in
                    switch status {
                        case .empty: ProgressView()
                        case .success(let image): image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                width: 160,
                                height: 160,
                                alignment: .center
                            )
                            .clipped()
                        case .failure: Image(ImageResource.icPlaceholder45)
                        @unknown default: EmptyView()
                    }
                }
            }
            
            Text(playList.name)
                .foregroundColor(Color.colorText)
                .font(.system(size: 12, weight: Font.Weight.regular))
                .lineLimit(1)
            
            Text(playList.countTracks)
                .foregroundColor(Color.colorText)
                .font(.system(size: 12, weight: Font.Weight.regular))
                .lineLimit(1)
        }
    }
}

#Preview {
    PlayListItem(
        playList: PlayListUIModel(
            id: 1,
            name: "Best songs 2021",
            image: "https://static.eldorado.ru/promo/src/mem-skebob/img/img1.webp",
            countTracks: "1 трек",
            tracks: []
        )
    )
}

#Preview {
    PlayListItem(
        playList: PlayListUIModel(
            id: 1,
            name: "Best songs 2021",
            image: "https://static.eldorado.ru/promo/src/mem-skebob/img/img1.webp",
            countTracks: "1 трек",
            tracks: []
        )
    )
}

