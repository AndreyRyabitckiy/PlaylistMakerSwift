import SwiftUI

struct MainScreen:View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView() {
            SearchScreen(
                screenState: .notFoundState,
                trackList:[]
            )
            .tabItem {
                Label("Поиск", systemImage: "magnifyingglass")
            }
            .tag(0)
            
            MediaLibraryScreen(
                trackList:[],
                playLists: []
            )
            .tabItem {
                Label("Медиатека", systemImage: "music.note.square.stack")
            }
            .tag(1)
            
            SettingsScreen()
                .tabItem {
                    Label("Настройки", systemImage: "gearshape")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainScreen()
}
