//
//  ButtonLoadingStyle.swift
//  ButtonLoading
//
//  Created by Denis Rybkin on 2022-12-02.
//

import SwiftUI

struct ButtonLoadingStyle: ButtonStyle {
    
    @Binding private var isLoading: Bool
    
    init(isLoading: Binding<Bool> = .constant(false)) {
        self._isLoading = isLoading
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
                .padding(12)
                .frame(maxWidth: .infinity)
                .foregroundColor(isLoading ? .clear : .white)
                .background(isLoading ? .blue.opacity(0.8) : .blue)
                .clipShape(Capsule())
            ProgressView()
                .opacity(isLoading ? 1 : 0)
                .tint(.white)
                .scaleEffect(1.5, anchor: .center)
        }
            .animation(.easeInOut, value: isLoading)
    }
    
}

/// How to use:
/// Button(action: buttonAction) {
///     Text(label)
/// }
///     .loadingStyle($isLoading)
extension Button {
    func loadingStyle(_ isLoading: Binding<Bool> = .constant(false)) -> some View {
        buttonStyle(ButtonLoadingStyle(isLoading: isLoading))
    }
}
