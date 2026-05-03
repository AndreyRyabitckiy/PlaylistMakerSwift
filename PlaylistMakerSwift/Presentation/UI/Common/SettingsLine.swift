import SwiftUI

struct SettingsLine: View {
    let label: String
    let lineType: SettingLineType
    let image: ImageResource?
    let action: () -> Void
    @State private var isEnabled = true
    
    var body: some View {
        
        switch lineType {
        case .ImageLine:
            Button(action: action) {
                Text(label)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color.colorText)
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 8))
                
                Spacer()
                
                if let image = image {
                    Image(image)
                        .padding(.trailing, 12)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        case .SwitchLine:
            HStack(spacing: 0) {
                Text(label)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(Color.colorText)
                    .padding(EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 8))
                
                Spacer()
                
                Toggle(isOn: $isEnabled) {
                    
                }
                .toggleStyle(SwitchToggleStyle(tint: .mint))
                .onChange(of: isEnabled) {
                    action()
                }
                .scaleEffect(0.7)
                .fixedSize()
                .padding(.trailing, 0)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    SettingsLine(
        label: "Поделиться приложением",
        lineType: .ImageLine,
        image: ImageResource.icShare24,
        action: {}
    )
}

#Preview {
    SettingsLine(
        label: "Темная тема",
        lineType: .SwitchLine,
        image: nil,
        action: {}
    )
}
