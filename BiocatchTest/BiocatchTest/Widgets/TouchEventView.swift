//
//  TouchEventView.swift
//  BiocatchTest
//
//  Created by Eric Shorr on 11/04/2021.
//

import UIKit

@objc protocol TouchEventViewDelegate
{
    func addTouchEvent(touchEvent: TouchEvent)
}

class TouchEventView: UIView {
    
    var velocity:Double = 0.0
    var pressTime:Double = 0.0
    
    var beganTimeInterval:TimeInterval = 0.0
    var oldMoveTimeInterval:TimeInterval?
    
    @IBOutlet weak var delegate:TouchEventViewDelegate?
    
//    var touchDownTimer:Timer? // not doing the analysis in real time
    
    var touchEvent:TouchEvent?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        if let touch = touches.first
        {
            self.touchEvent = TouchEvent(timestamp: touch.timestamp)
            
            self.beganTimeInterval = touch.timestamp
        }
        
        
//        self.touchDownTimer = Timer.scheduledTimer(withTimeInterval: TouchEventManager.shared.longPressTimeThreshold, repeats: false, block: { (timer) in
//            print("long press time out")
//        })
        
//        print(touches.first?.timestamp as Any)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first
        {
            var timeInteral:TimeInterval = 0.0
            
            if let oldMoveTimeInterval = self.oldMoveTimeInterval
            {
                timeInteral = oldMoveTimeInterval - touch.timestamp
            }
            else
            {
                timeInteral = self.beganTimeInterval - touch.timestamp
            }
            
            self.oldMoveTimeInterval = touch.timestamp
            
            let velocity = touch.velocity(view: self, timeinterval: timeInteral)
            
            // not doing analysis in real time
//            if ( abs(velocity.x) > TouchEventManager.shared.swipeSpeedThreshold) || (abs(velocity.y) > TouchEventManager.shared.swipeSpeedThreshold)
//            {
//                print("slow down, man")
//            }
            
            if let touchEvent = self.touchEvent
            {
                if abs(velocity.x) > touchEvent.maxSwipeVelocity
                {
                    touchEvent.maxSwipeVelocity = abs(velocity.x)
                }
                else if abs(velocity.y) > touchEvent.maxSwipeVelocity
                {
                    touchEvent.maxSwipeVelocity = abs(velocity.y)
                }
            }
            
//            print(velocity)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touchEvent = self.touchEvent,
           let touch = touches.first
        {
            touchEvent.tapDuration = touch.timestamp - touchEvent.timestamp
            
            if let delegate = self.delegate
            {
                delegate.addTouchEvent(touchEvent: touchEvent)
            }
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
