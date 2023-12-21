//
//  ButtonView.swift
//  DataFlow4.4
//
//  Created by Глеб Зобнин on 18.12.2023.
//

import SwiftUI

struct ButtonView: View {
    //Когда Binding?
    //1. ССылка на State
    //2. Не требует иници ализации (откуда-то берут)
    //3. Значенние св-ва меняется со вз-вием интерфейса и нужна передача в родительский объект (представление)
    @ObservedObject var timer: TimeCounter
    //по сути как binding
    
    var body: some View {
        Button(action: timer.startTimer){
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2.0)
        )
        
    }
}

#Preview {
    ButtonView(timer: TimeCounter())
}
