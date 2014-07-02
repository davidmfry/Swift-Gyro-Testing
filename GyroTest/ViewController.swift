//
//  ViewController.swift
//  GyroTest
//
//  Created by David Fry on 7/2/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    //var motionManager = CMMotionManager()
    
    @IBOutlet var yawLabel : UILabel = nil
    @IBOutlet var pitchLabel : UILabel = nil
    @IBOutlet var rollLabel : UILabel = nil
    
    let theGyroController = GyroController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        theGyroController.startMotion()
        //theGyroController.outputAttitude(yawLabel,pitch: pitchLabel, roll: rollLabel)
        
        yawLabel.text = "\(theGyroController.yaw)"
        pitchLabel.text = "\(theGyroController.pitch)"
        rollLabel.text = "\(theGyroController.roll)"
    
    }




}

