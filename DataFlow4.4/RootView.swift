//
//  RootView.swift
//  DataFlow4.4
//
//  Created by Глеб Зобнин on 18.12.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var userSettings = UserSettings()
    var body: some View {
        Group {
            if userSettings.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(userSettings) //временное окружение
    }
}

#Preview {
    RootView()
}
