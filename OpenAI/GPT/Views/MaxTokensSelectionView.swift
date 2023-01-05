import Foundation
import SwiftUI

struct MaxTokensSelectionView: View {
    @Binding var maxTokens: Int

    private let maxTokensOptions = [16, 25, 50, 100, 200, 500, 1000]

    var body: some View {
        Picker(selection: $maxTokens, label: Text("Max Tokens")) {
            ForEach(maxTokensOptions, id: \.self) { option in
                Text("\(option)").tag(option)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
