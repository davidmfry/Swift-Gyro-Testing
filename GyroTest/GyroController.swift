//
//  GyroController.swift
//  GyroTest
//
//  Created by David Fry on 7/2/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import UIKit
import CoreMotion

protocol GyroControllerProtocol
{
    func motionDataAvailable(yaw:Double, pitch:Double, roll:Double)
}

class GyroController: NSObject
{
    var delegate: GyroControllerProtocol?

    
    func getGyroData(motionManager:CMMotionManager)
    {
        motionManager.startDeviceMotionUpdates()
        
        if (motionManager.deviceMotionAvailable)
        {
            motionManager.deviceMotionUpdateInterval = 0.01
            
            var queue = NSOperationQueue.currentQueue()
            
            motionManager.startDeviceMotionUpdatesToQueue(queue, withHandler:
                {
                    deviceManager, error in
                    var attitude = motionManager.deviceMotion.attitude
                    self.delegate?.motionDataAvailable(attitude.yaw * 180 / M_PI, pitch: attitude.pitch * 180 / M_PI, roll: attitude.roll * 180 / M_PI)
                    if error
                    {
                        println("\(error)")
                    }
                
                })
        }
        else
        {
            var alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Could not find: Accelaromter, Gyroscope."
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
    }
    
}
