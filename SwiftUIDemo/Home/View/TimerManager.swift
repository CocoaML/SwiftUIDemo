//
//  TimerManager.swift
//  SwiftUIDemo
//
//  Created by ml on 2024/1/24.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @Published var isPaused = false
    
    init() {
        timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    }
    
    func pauseTimer() {
        timer.upstream.connect().cancel()
        isPaused = true
    }
    
    func startTimer() {
        timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
        isPaused = false
    }
}
