import Foundation
import OpenAISwift
import SwiftUI

struct GPTView: View {
    @State private var prompt = ""
    @State private var response = ""
    @State private var model = OpenAIModelType.gpt3(.davinci)
    @State private var models: [OpenAIModelType] = OpenAIModelType.gpt3.allCases
    @State private var isLoading: Bool = false
    @State private var maxTokens = 16

    let openAI = OpenAISwift(authToken: Auth.token)

    var body: some View {
        VStack {
            TextPromptInputView(prompt: $prompt)
            ModelSelectionView(model: $model, models: $models)
            MaxTokensSelectionView(maxTokens: $maxTokens)
            SendCompletionButtonView(openAI: openAI, prompt: $prompt, model: $model, maxTokens: $maxTokens, response: $response, isLoading: $isLoading)
            ResponseDisplayView(response: $response, isLoading: $isLoading)
        }.disabled(isLoading)
    }
}
