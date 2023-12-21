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
            Text("Hi, \(UserDefaults.standard.string(forKey: "userName") ?? "")")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(timer: timer)
            Button(action: {
                user.isLoggedIn.toggle()
                UserDefaults.standard.set(user.isLoggedIn, forKey: "isLoggedIn")
            }){
                Text("Log out")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
            }
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 2.0)
            )
            
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

