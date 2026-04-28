import SwiftUI

struct SearchScreen: View {
    
    @State private var searchText = ""
    var trackList: [TrackUIModel]
    
    var body: some View {
        VStack(
            alignment: HorizontalAlignment.leading
        ) {
            Text("Поиск")
                .foregroundColor(Color.text)
                .font(.system(size: 22, weight: Font.Weight.medium))
                .padding(EdgeInsets(top: 14, leading: 16, bottom: 16, trailing: 0))
            
            HStack {
                Image(ImageResource.icSearch14)
                    .padding(.vertical, 12)
                    .padding(.leading, 12)
                
                TextField("Поиск", text: $searchText)
                
                if !searchText.isEmpty {
                    Button(action: { searchText = "" }) {
                        Image(ImageResource.icClose16)
                    }
                    .padding(.trailing, 10)
                }
            }
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 16)
            
            LazyVStack {
                ForEach(trackList) { list in
                    TrackItem(track: list)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .background(Color.background)
    }
}

#Preview {
    SearchScreen(
        trackList:[
            TrackUIModel(
                id: 1, trackName: "Here Comes The Sun",
                groupName: "The Beatles",
                trackDuration: "2:30",
                albumImageUrl: ""
            ),
            TrackUIModel(
                id: 2, trackName: "Here Comes The Sun",
                groupName: "The Beatles",
                trackDuration: "4:01",
                albumImageUrl: "https://images.firma-gamma.ru/images/2/8/d100032710154u_3.jpg"
            ),
            TrackUIModel(
                id: 3, trackName: "Here Comes The Sun",
                groupName: "The Beatles",
                trackDuration: "3:01",
                albumImageUrl: ""
            ),
        ]
    )
}
