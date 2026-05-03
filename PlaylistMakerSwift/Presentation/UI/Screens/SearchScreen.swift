import SwiftUI

struct SearchScreen: View {
    
    @Environment(\.colorScheme)private var colorScheme
    @State private var searchText = ""
    var screenState: StateSearchScreen
    var trackList: [TrackUIModel]
    
    var body: some View {
        VStack(
            alignment: HorizontalAlignment.leading,
            spacing: 0
        ) {
            Text("Поиск")
                .foregroundColor(Color.colorText)
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
            .background(Color.colorGrayEditText)
            .cornerRadius(8)
            .padding(.horizontal, 16)
            
            switch screenState {
            case .loadingState:
                ProgressView()
                    .scaleEffect(2)
                    .tint(Color.blue)
                    .frame(maxWidth: .infinity,
                           maxHeight: .infinity)
                
            case .errorState:
                Spacer()
                
                Image(
                    colorScheme == .light ? ImageResource.icErrorLight120 : ImageResource.icErrorDark120
                )
                    .frame(
                        maxWidth:.infinity,
                        alignment: .center
                    )
                    
                
                Text("Проблемы со связью \n\nЗагрузка не удалась. Проверьте подключение к интернету")
                    .font(.system(size: 19, weight: Font.Weight.medium))
                    .frame(
                        maxWidth:.infinity
                    )
                    .padding(16)
                    .multilineTextAlignment(.center)
                
                ButtonPlayListMaker(label: "Обновить") {
                    
                    }
                .frame(maxWidth: .infinity)
                .padding(24)
                
                Spacer()
            case .notFoundState:
                ListIsEmptyError(label: "Ничего не нашлось")
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    )
            case .historyState:
                LazyVStack {
                    Text("Вы искали")
                        .font(
                            .system(
                                size: 19,
                                weight:.medium
                            )
                        )
                        .padding(.top, 42)
                        .padding(.bottom, 8)
                    
                    ForEach(trackList) { list in
                        TrackItem(track: list)
                    }
                    
                    ButtonPlayListMaker(label: "Очистить историю") {
                        
                        }
                    .padding(.top, 24)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
            case .SearchState:
                LazyVStack {
                    ForEach(trackList) { list in
                        TrackItem(track: list)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            
            
        }
        .background(Color.colorBackground)
    }
}

#Preview {
    SearchScreen(
        screenState: .loadingState,
        trackList:[]
    )
}

#Preview {
    SearchScreen(
        screenState: .errorState,
        trackList:[]
    )
}

#Preview {
    SearchScreen(
        screenState: .notFoundState,
        trackList:[]
    )
}

#Preview {
    SearchScreen(
        screenState: .historyState,
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
            )
        ]
    )
}


#Preview {
    SearchScreen(
        screenState: .SearchState,
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
            )
        ]
    )
}
