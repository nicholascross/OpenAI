import Foundation
import OpenAISwift

extension OpenAIModelType {
    static var gpt3: [OpenAIModelType.GPT3] {
        return [.davinci, .curie, .babbage, .ada]
    }
}

extension Array where Element == OpenAIModelType.GPT3 {
    var allCases: [OpenAIModelType] {
        return map { .gpt3($0) }
    }
}

extension OpenAIModelType: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(modelName)
    }

    public static func == (lhs: OpenAIModelType, rhs: OpenAIModelType) -> Bool {
        return lhs.modelName == rhs.modelName
    }
}
