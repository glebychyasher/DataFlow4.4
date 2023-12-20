//
//  ContentView.swift
//  DataFlow4.4
//
//  Created by Глеб Зобнин on 18.12.2023.
//

import SwiftUI

struct ContentView: View {

    //State-свойства нужны:
    //1. Меняется интерфейс
    //2. Единственный первоисточник (не влияют внешние воздействия), поэтому приватный
    //3. Инициализация нужна
    
    @StateObject private var timer = TimeCounter() //с ссылочными типами используем StateObject
    //state с классом бесполезен - ссылка не меняется
    @EnvironmentObject private var user: UserSettings
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(timer: timer)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(UserSettings())
}
//Принципы работы с данными:
//1 доступ к данным == зависимость
//2 единый источник данных
//state - ячейка памяти, binding - ссылка
//почитать о bindable

