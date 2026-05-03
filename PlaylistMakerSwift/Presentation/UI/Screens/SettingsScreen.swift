import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            Text("Настройки")
                .foregroundColor(Color.colorText)
                .font(.system(size: 22, weight: Font.Weight.medium))
                .padding(EdgeInsets(top: 14, leading: 16, bottom: 16, trailing: 0))
            
            SettingsLine(
                label: "Поделиться приложением",
                lineType: .SwitchLine,
                image: nil,
                action: {}
            )
            .padding(.top, 24)
            
            SettingsLine(
                label: "Поделиться приложением",
                lineType: .ImageLine,
                image: ImageResource.icShare24,
                action: {}
            )
            
            SettingsLine(
                label: "Написать в поддержку",
                lineType: .ImageLine,
                image: ImageResource.icSupport24,
                action: {}
            )
            
            SettingsLine(
                label: "Пользовательское соглашение",
                lineType: .ImageLine,
                image: ImageResource.icArrowRight24,
                action: {}
            )
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

#Preview {
    SettingsScreen()
}
