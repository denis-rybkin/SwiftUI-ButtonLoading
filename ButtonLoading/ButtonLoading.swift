//
//  ButtonLoading.swift
//  ButtonLoading
//
//  Created by Denis Rybkin on 2022-12-02.
//

import SwiftUI

struct ButtonLoading: View {
    
    private let label: String
    private let action: () -> Void
    @Binding private var isLoading: Bool
    
    init(label: String,
         isLoading: Binding<Bool> = .constant(false),
         action: @escaping () -> Void) {
        self.label = label
        self.action = action
        self._isLoading = isLoading
    }
    
    var body: some View {
        Button(action: buttonAction) {
            HStack(spacing: 10) {
                Text(label)
                if isLoading {
                    ProgressView()
                        .tint(.white)
                        .scaleEffect(1.25, anchor: .center)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(12)
        }
        .foregroundColor(.white)
        .background(isLoading ? .blue.opacity(0.8) : .blue)
        .clipShape(Capsule())
        .animation(.easeInOut, value: isLoading)
    }
    
    private func buttonAction() {
        guard !isLoading else { return }
        action()
    }
    
}

struct ButtonLoading_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLoading(label: "Login", action: { })
    }
}
