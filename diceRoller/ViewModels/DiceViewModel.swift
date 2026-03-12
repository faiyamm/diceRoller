//
//  DiceViewModel.swift
//  diceRoller
//
//  Created by Fai on 11/03/26.
//

import Combine
import Foundation

class DiceViewModel: ObservableObject {
    @Published var diceValue: Int = 1
    @Published var isRunning: Bool = false
    @Published var statusMessage: String = "Tap Start to Play"
    
    private let motionManager = MotionManager()
    private var lastRollTime = Date.distantPast
    private let cooldown: TimeInterval = 0.6
    
    func toggle() {
        isRunning ? stop() : start()
    }
    
    func start() {
        isRunning = true
        statusMessage = "Shake it hard!"
        motionManager.startUpdates { [weak self] in
            self?.roll()
        }
    }
    
    func stop() {
        isRunning = false
        statusMessage = "Stopped"
        motionManager.stopUpdates()
    }
    
    func roll() {
        let now = Date()
        if now.timeIntervalSince(lastRollTime) > cooldown {
            diceValue = Int.random(in: 1...6)
            lastRollTime = now
            statusMessage = "You rolled a \(diceValue)!"
        }
    }
}
