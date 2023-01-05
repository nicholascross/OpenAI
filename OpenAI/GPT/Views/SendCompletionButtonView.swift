import Foundation
import OpenAISwift
import SwiftUI

struct SendCompletionButtonView: View {
    let openAI: OpenAISwift
    @Binding var prompt: String
    @Binding var model: OpenAIModelType
    @Binding var maxTokens: Int
    @Binding var response: String
    @Binding var isLoading: Bool

    var body: some View {
        Button(action: {
            isLoading = true
            self.sendCompletion()
        }) {
            Text("Request Completion")
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }

    func sendCompletion() {
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
