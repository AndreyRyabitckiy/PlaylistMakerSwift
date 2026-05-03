import SwiftUI

struct ListIsEmptyError: View {
    var label: String
    @Environment(\.colorScheme)private var colorScheme
    
    
    var body: some View {
        VStack(spacing: 0) {
            Image(
                colorScheme == .light ? ImageResource.icNotFoundLight120 : ImageResource.icNotFoundDark120
            )
            .frame(
                maxWidth:.infinity,
                alignment: .center
            )
            
            Text(label)
                .font(.system(size: 19, weight: Font.Weight.medium))
                .frame(
                    maxWidth:.infinity,
                    alignment: .center
                )
                .padding(16)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    ListIsEmptyError(label: "Ваша медиатека пуста")
}
