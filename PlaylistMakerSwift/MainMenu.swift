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
            )
                .padding(.horizontal, 16)
                .layoutPriority(1)
            
            Spacer(minLength: 16)
            
            ButtonMainMenu(
                label: "Медиатека",
                image: ImageResource.mainMenuIcMedia
            )
                .padding(.horizontal, 16)
                .layoutPriority(1)
            
            Spacer(minLength: 16)
            
            ButtonMainMenu(
                label: "Настройки",
                image: ImageResource.mainMenuIcSettings
            )
            .padding(.horizontal, 16)
            .layoutPriority(1)
            
            
        }
        .background(Color.mainMenuBackground)
    }
}

private func ButtonMainMenu (
    label: String,
    image: ImageResource
) -> some View {
    Button(
        action: {
        
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
}

#Preview {
    MainMenu()
}
