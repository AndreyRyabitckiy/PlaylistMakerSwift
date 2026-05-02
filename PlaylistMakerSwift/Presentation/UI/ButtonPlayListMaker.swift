import SwiftUI

struct ButtonPlayListMaker: View {
    var label: String
    let action: () -> Void
        
    var body: some View {
        Button(action: action) {
            VStack {
                Text(label)
                    .padding(
                        EdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
                    )
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.colorBackground)
            }
            .background(Color.colorText)
            .cornerRadius(54)
        }
    }
}

#Preview {
    ButtonPlayListMaker(
        label: "Обновить", action: {}
    )
}
