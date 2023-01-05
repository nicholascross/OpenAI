import Foundation
import SwiftUI

struct TextPromptInputView: View {
    @Binding var prompt: String

    var body: some View {
        TextField("Enter text prompt", text: $prompt)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
