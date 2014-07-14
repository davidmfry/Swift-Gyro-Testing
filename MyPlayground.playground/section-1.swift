// Playground - noun: a place where people can play

import UIKit
import CoreMotion

let mm = CMMotionManager()

mm.startDeviceMotionUpdates()
mm.deviceMotionUpdateInterval = 0.01
mm.deviceMotion.attitude.yaw








