//  Created by Axel Ancona Esselmann on 11/14/23.
//

import SwiftUI
import Validated

struct ContentView: View {

    @State
    private var ageText = ""

    @State @Validated(validator: IntRangeValidator(from: 5, to: 100))
    private var age: ValidationResult = .none

    var body: some View {
        VStack(alignment: .leading) {
            GroupBox {
                TextField("", text: $ageText)
                    .padding(4)
                    .border(colorForState(age.state))
                if let error = age.error {
                    Text(error.localizedDescription)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            }
            Spacer()
        }
        .padding()
        .onChange(of: ageText) {
            age = .raw(ageText)
        }
    }

    private func colorForState(_ state: ValidationState) -> Color {
        switch state {
        case .notValidated: return .clear
        case .valid:        return .green
        case .invalid:      return .red
        }
    }
}
