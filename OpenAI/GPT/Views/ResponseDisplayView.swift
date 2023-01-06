import Foundation
import SwiftUI

struct ResponseDisplayView: View {
    @Binding var response: String
    @Binding var isLoading: Bool

    var body: some View {
        if isLoading {
            ProgressView().progressViewStyle(CircularProgressViewStyle())
        } else {
            ZStack(alignment: .topLeading) {
                ScrollView {
                    VStack {
                        Spacer()
                        Text(response)
                            .frame(minHeight: 100)
                            .lineLimit(nil)
                            .padding()
                            .multilineTextAlignment(.leading)
                    }.frame(maxWidth: .infinity)
                }
                .background(.gray)
                .cornerRadius(10)
                Button(action: {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(self.response, forType: .string)
                }) {
                    Text("📋")
                }.padding()
            }

        }
    }
}
