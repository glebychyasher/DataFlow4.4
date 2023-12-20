//
//  TimeCounter.swift
//  DataFlow4.4
//
//  Created by Глеб Зобнин on 18.12.2023.
//

import Foundation
import Combine

final class TimeCounter: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var counter = 3
    var buttonTitle = "Start"
    
    
    var timer: Timer?
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true)
            buttonDidTapped()
        }
        
    }
    
    @objc
    private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
            
        }
        objectWillChange.send() //отправка инфы о том что класс изменился
    }
    
    private func killTimer() {
        timer?.invalidate() //остановка таймер
        timer = nil //выгрузка
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        objectWillChange.send()
    }
}
