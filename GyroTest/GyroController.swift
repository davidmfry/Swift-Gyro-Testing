//
//  GyroController.swift
//  GyroTest
//
//  Created by David Fry on 7/2/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import UIKit
import CoreMotion

class GyroController: NSObject
{
    var motionManager = CMMotionManager()
    
    var yaw: Double = 0.0
    var pitch: Double = 0.0
    var roll: Double = 0.0
    
    func startMotion()
    {
        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {deviceManager, error in
            self.yaw = self.motionManager.deviceMotion.attitude.yaw * 180 / M_PI
            self.pitch = self.motionManager.deviceMotion.attitude.pitch * 180 / M_PI
            self.roll = self.motionManager.deviceMotion.attitude.roll * 180 / M_PI
            
            if error
            {
                println("\(error)")
            }
            
            })
    }
    
    func outputAttitude(yaw: UILabel, pitch: UILabel, roll:UILabel)
    {
        yaw.text = "\(self.yaw)"
        pitch.text = "\(self.pitch)"
        roll.text = "\(self.roll)"
    }
}
