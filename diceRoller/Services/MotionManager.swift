//
//  MotionManager.swift
//  diceRoller
//
//  Created by Fai on 11/03/26.
//

import Foundation
import CoreMotion

class MotionManager {
    private let manager = CMMotionManager()
    private let threshold = 1.5
    
    func startUpdates(onShake: @escaping () -> Void) {
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.02
            manager.startDeviceMotionUpdates(to: .main) { data, error in
                guard let userAccel = data?.userAcceleration else { return }

                let magnitude = sqrt(pow(userAccel.x, 2) + pow(userAccel.y, 2) + pow(userAccel.z, 2))
                
                if magnitude > self.threshold {
                    onShake()
                }
            }
        }
    }
    
    func stopUpdates() {
        manager.stopDeviceMotionUpdates()
    }
}
