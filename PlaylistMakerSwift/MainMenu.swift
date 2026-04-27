import SwiftUI

struct MainMenu: View {
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text("Playlist maker")
                .foregroundColor(Color.white)
                .font(.system(size: 22, weight: Font.Weight.medium))
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 40, trailing: 0))
                
            ButtonMainMenu(
                label: "Поиск",
                image: ImageResource.mainMenuIcSearch
            ) {
                
            }
            
            Spacer(minLength: 16)
            
            ButtonMainMenu(
                label: "Медиатека",
                image: ImageResource.mainMenuIcMedia
            ) {
                
            }
            
            Spacer(minLength: 16)
            
            ButtonMainMenu(
                label: "Настройки",
                image: ImageResource.mainMenuIcSettings
            ) {
                
            }
        }
        .background(Color.mainMenuBackground)
    }
}

private struct ButtonMainMenu: View {
    private let label: String
    private let image: ImageResource
    private let action: () -> Void
    
    init(label: String, image: ImageResource, action: @escaping () -> Void) {
        self.label = label
        self.image = image
        self.action = action
    }
    
    fileprivate var body: some View {
        Button(
            action: {
                action()
            }
        ) {
            HStack(spacing: 8) {
                Image(image)
                Text(label)
                    .foregroundColor(Color.mainMenuColorButtonText)
                    .font(.system(size: 22, weight: Font.Weight.medium))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .padding(.horizontal, 16)
    }
}

#Preview {
    MainMenu()
}
