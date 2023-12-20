//
//  LOGINVIEW.swift
//  DataFlow4.4
//
//  Created by Глеб Зобнин on 18.12.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var user: UserSettings //общие объекты для разных зон приложения
    @State private var name = ""
    
    
    @AppStorage("userName") var userName = ""
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some View {
        HStack {
            Text("\(name.count)")
                .hidden() //Как выровнять TextField относительно ВСЕГО экрана??
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Text("\(name.count)")
                .foregroundStyle(isLogin() ? .green : .red)
        }
        .padding()
        Button(action: login){
            Label("Ok", systemImage: "checkmark.circle")
        }
        .disabled(!isLogin())
    }
}

extension LoginView {
    private func login() {
        user.name = name
        userName = name
        isLoggedIn = true
        user.isLoggedIn.toggle()
    }
}

extension LoginView {
    private func isLogin() -> Bool {
        if name.count >= 3 {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    LoginView()
}
