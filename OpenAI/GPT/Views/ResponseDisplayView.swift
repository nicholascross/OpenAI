import Foundation
import SwiftUI

struct ResponseDisplayView: View {
    @Binding var response: String
    @Binding var isLoading: Bool

    var body: some View {
        if isLoading {
            ProgressView().progressViewStyle(CircularProgressViewStyle())
        } else {
            VStack {
                Text(response)
                    .frame(minHeight: 100)
                    .lineLimit(nil)
                    .padding()
            }.frame(maxWidth: .infinity)
        }
    }
}
