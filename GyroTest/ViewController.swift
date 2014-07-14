//
//  ViewController.swift
//  GyroTest
//
//  Created by David Fry on 7/2/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, GyroControllerProtocol {
    
    
    @IBOutlet var yawLabel : UILabel = nil
    @IBOutlet var pitchLabel : UILabel = nil
    @IBOutlet var rollLabel : UILabel = nil
    
    let motionManager = CMMotionManager()
    let theGyroController: GyroController = GyroController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.theGyroController.delegate = self
        
        self.theGyroController.getGyroData(motionManager)
    
    }
    
    func motionDataAvailable(yaw: Double)
    {
        self.yawLabel.text = NSString(format:"%.0f", yaw)
        //self.pitchLabel.text = NSString(format:"%.0f", pitch)
        //self.rollLabel.text = NSString(format:"%.0f", roll)
    }




}

