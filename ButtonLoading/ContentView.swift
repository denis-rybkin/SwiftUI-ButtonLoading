//
//  ContentView.swift
//  ButtonLoading
//
//  Created by Denis Rybkin on 2022-12-02.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            textField(placeholder: "Email", text: $email)
            textField(placeholder: "Password", text: $password)
            ButtonLoading(label: "Login",
                          isLoading: $viewModel.isLoading,
                          action: viewModel.fetchSomething)
        }
            .padding()
    }
    
    private func textField(placeholder: String,
                           text: Binding<String>) -> some View {
        TextField(placeholder, text: text)
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 15)
            .background(
                Capsule()
                    .strokeBorder(.gray, lineWidth: 1)
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
