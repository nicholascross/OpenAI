import Foundation
import OpenAISwift
import SwiftUI

struct ModelSelectionView: View {
    @Binding var model: OpenAIModelType
    @Binding var models: [OpenAIModelType]

    var body: some View {
        Picker(selection: $model, label: Text("Model")) {
            ForEach(models, id: \.self) { model in
                Text(model.modelName).tag(model)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
