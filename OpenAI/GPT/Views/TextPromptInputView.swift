import Foundation
import SwiftUI
import OpenAISwift

struct TextPromptInputView: View {
    let openAI: OpenAISwift
    @Binding var prompt: String
    @Binding var model: OpenAIModelType
    @Binding var maxTokens: Int
    @Binding var response: String
    @Binding var isLoading: Bool

    var body: some View {
        VStack {
            HStack {
                TextField("Enter text prompt", text: $prompt, onCommit: sendCompletion)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendCompletion) {
                    Text("⌲")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                }
                .buttonStyle(.borderless)
            }
        }
    }

    func sendCompletion() {
        isLoading = true
        openAI.sendCompletion(with: prompt, model: model, maxTokens: maxTokens) { result in
            isLoading = false
            switch result {
            case let .success(success):
                self.response = success.choices.first?.text ?? ""
            case let .failure(error):
                self.response = error.localizedDescription
            }
        }
    }
}
