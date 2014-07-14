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
    func motionDataAvailable(yaw:Double)
}

class GyroController: NSObject
{
    var delegate: GyroControllerProtocol?
    //let motionManager = CMMotionManager()
    
    var yaw: Double = 0.0
    var pitch: Double = 0.0
    var roll: Double = 0.0
    //var myYaw = 0.0
    

    
//    func startMotion()
//    {
//        motionManager.startDeviceMotionUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {deviceManager, error in
//            self.yaw = self.motionManager.deviceMotion.attitude.yaw * 180 / M_PI
//            self.pitch = self.motionManager.deviceMotion.attitude.pitch * 180 / M_PI
//            self.roll = self.motionManager.deviceMotion.attitude.roll * 180 / M_PI
//            
//            if error
//            {
//                println("\(error)")
//            }
//            
//            })
//        
//
//    }
    
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
                    self.delegate?.motionDataAvailable(attitude.yaw * 180 / M_PI)
                    if error
                    {
                        println("\(error)")
                    }
                
                })
        }
    }
    
    func outputAttitude()
    {
        
        println("\(self.yaw)")

    }
}
