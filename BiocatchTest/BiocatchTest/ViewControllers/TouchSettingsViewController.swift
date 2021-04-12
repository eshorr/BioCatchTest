//
//  EditEmojiViewController.swift
//  EmojiDictionary
//
//  Created by Eric Shorr on 29/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class TouchSettingsViewController: FormEmojiViewController {
    
    @IBOutlet weak var fldTapFrequency: LinkedTextField!
    @IBOutlet weak var fldTapThreshold: LinkedTextField!
    @IBOutlet weak var fldMaxSwipeSpeed: LinkedTextField!
    @IBOutlet weak var fldMaxTapHold: LinkedTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fldTapFrequency.text = "\(TouchEventManager.shared.tapNumberThreshold)"
        self.fldTapThreshold.text = "\(TouchEventManager.shared.tapFrequencyThreshold)"
        self.fldMaxTapHold.text = "\(TouchEventManager.shared.longPressTimeThreshold)"
        self.fldMaxSwipeSpeed.text = "\(TouchEventManager.shared.swipeSpeedThreshold)"
    }
    
    @IBAction override func save(_ sender: Any?)
    {
        if let tapNumberThreshold = self.fldTapThreshold.text,
           let n = Int(tapNumberThreshold)
        {
            TouchEventManager.shared.tapNumberThreshold = n
        }
        
        if let tapNumberThreshold = self.fldTapFrequency.text,
           let n = Double(tapNumberThreshold)
        {
            TouchEventManager.shared.tapFrequencyThreshold = n
        }
        
        if let tapHold = self.fldMaxTapHold.text,
           let n = Double(tapHold)
        {
            TouchEventManager.shared.longPressTimeThreshold = n
        }
        
        if let swipeSpeed = self.fldMaxSwipeSpeed.text,
           let n = Float(swipeSpeed)
        {
            TouchEventManager.shared.swipeSpeedThreshold = CGFloat(n)
        }
        
        self.view.endEditing(true)
    }
    
}
