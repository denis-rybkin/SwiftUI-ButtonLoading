//
//  ViewModel.swift
//  ButtonLoading
//
//  Created by Denis Rybkin on 2022-12-02.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var isLoading = false
    
    func fetchSomething() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isLoading = false
        }
    }
    
}
