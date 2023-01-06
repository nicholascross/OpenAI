import Foundation
import OpenAISwift
import SwiftUI

struct ModelSelectionView: View {
    @Binding var model: OpenAIModelType

    var body: some View {
        Picker(selection: $model, label: Text("Model")) {
            ForEach(OpenAIModelType.gpt3.allCases, id: \.self) { model in
                Text(model.modelName).tag(model)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
