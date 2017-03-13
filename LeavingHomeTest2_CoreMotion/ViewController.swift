//
//  ViewController.swift
//  LeavingHomeTest2_CoreMotion
//
//  Created by Renyi Hou on 13/3/17.
//  Copyright © 2017 Renyi Hou. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var XaccLabel: UILabel!
    @IBOutlet weak var YaccLabel: UILabel!
    @IBOutlet weak var ZaccLabel: UILabel!
    @IBOutlet weak var XaccValue: UILabel!
    @IBOutlet weak var YaccValue: UILabel!
    @IBOutlet weak var ZaccValue: UILabel!
    
    @IBOutlet weak var XgyroLabel: UILabel!
    @IBOutlet weak var YgyroLabel: UILabel!
    @IBOutlet weak var ZgyroLabel: UILabel!
    @IBOutlet weak var XgyroValue: UILabel!
    @IBOutlet weak var YgyroValue: UILabel!
    @IBOutlet weak var ZgyroValue: UILabel!
    
    @IBOutlet weak var XmagLabel: UILabel!
    @IBOutlet weak var YmagLabel: UILabel!
    @IBOutlet weak var ZmagLabel: UILabel!
    @IBOutlet weak var XmagValue: UILabel!
    @IBOutlet weak var YmagValue: UILabel!
    @IBOutlet weak var ZmagValue: UILabel!

    
    
/*
    var currentXaccValue: Double = 0.0
    var currentYaccValue: Double = 0.0
    var currentZaccValue: Double = 0.0
    
    var currentXgyroValue: Double = 0.0
    var currentYgyroValue: Double = 0.0
    var currentZgyroValue: Double = 0.0
*/
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() { // 这个function就是第一个界面
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set Motion Manager Properties
        motionManager.accelerometerUpdateInterval = 0.3 //update frequency
        motionManager.magnetometerUpdateInterval = 0.3
        motionManager.gyroUpdateInterval = 0.3
        
        
        //Start Recording Data
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
            
            self.outputAccData(acceleration: accelerometerData!.acceleration)
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
        
        motionManager.startGyroUpdates(to: OperationQueue.current!)
        {
            (gyroData: CMGyroData?, NSError) -> Void in
            self.outputGyroData(rotation: gyroData!.rotationRate)
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
        
        motionManager.startMagnetometerUpdates(to: OperationQueue.current!)
        {
            (magnetometerData: CMMagnetometerData?, NSError) -> Void in
            self.outputMagData(magneticField: magnetometerData!.magneticField )
            if(NSError != nil) {
                print("\(NSError)")
            }
        }
    }
    
    func outputAccData(acceleration: CMAcceleration)
    {
        XaccValue.text = String(format:"%.3f",acceleration.x)
        YaccValue.text = String(format:"%.3f",acceleration.y)
        ZaccValue.text = String(format:"%.3f",acceleration.z)
    }
        
    func outputGyroData(rotation: CMRotationRate)
    {
        XgyroValue.text = String(format:"%.3f",rotation.x)
        YgyroValue.text = String(format:"%.3f",rotation.y)
        ZgyroValue.text = String(format:"%.3f",rotation.z)
    }
    
    func outputMagData(magneticField: CMMagneticField)
    {
        XmagValue.text = String(format:"%.3f",magneticField.x)
        YmagValue.text = String(format:"%.3f",magneticField.y)
        ZmagValue.text = String(format:"%.3f",magneticField.z)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startAccelerometerUpdates() {
        if motionManager.accelerometerData != nil{
            
        }
    }
     
}

