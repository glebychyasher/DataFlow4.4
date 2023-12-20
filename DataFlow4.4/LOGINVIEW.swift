//
//  LOGINVIEW.swift
//  DataFlow4.4
//
//  Created by Глеб Зобнин on 18.12.2023.
//

import SwiftUI

struct LOGINVIEW: View {
    @EnvironmentObject private var user: UserSettings //общие объекты для разных зон приложения
    @State private var name = ""
    
    var body: some View {
        TextField("Enter your name", text: $name)
            .multilineTextAlignment(.center)
        Button(action: login){
            Label("Ok", systemImage: "checkmark.circle")
        }
    }
}

extension LOGINVIEW {
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LOGINVIEW()
}
