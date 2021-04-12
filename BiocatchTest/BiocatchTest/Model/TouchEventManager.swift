//
//  TouchEventManager.swift
//  BiocatchTest
//
//  Created by Eric Shorr on 11/04/2021.
//

import Foundation
import UIKit

enum TouchEventError: Error
{
    case TooFastError
    case TooLongError
    case TooManyTapsError
}

class TouchEventManager
{
    static let shared:TouchEventManager = TouchEventManager()
    
    var swipeSpeedThreshold:CGFloat = 1.0
    var tapFrequencyThreshold:TimeInterval = 5.0
    var tapNumberThreshold:Int = 5
    var longPressTimeThreshold:TimeInterval = 1.0
    
    private var tapEvents:[TouchEvent] = []
    
    func addTapEvent(_ tapEvent: TouchEvent) throws
    {
        self.tapEvents.append(tapEvent)
        
        if( tapEvent.maxSwipeVelocity > self.swipeSpeedThreshold )
        {
            // throw swipe speed error
            throw TouchEventError.TooFastError
        }
        else if( tapEvent.tapDuration > self.longPressTimeThreshold )
        {
            // throw long tap error
            throw TouchEventError.TooLongError
        }
        else if self.tapEvents.count >= self.tapNumberThreshold,
                self.tapNumberThreshold > 2
        {
            var n:Int = self.tapEvents.count - 1
            
            while n > self.tapEvents.count - self.tapNumberThreshold,
                self.tapEvents[n].timestamp - self.tapEvents[n-1].timestamp < self.tapFrequencyThreshold
            {
                n = n - 1
            }
            
            if n == self.tapEvents.count - self.tapNumberThreshold
            {
                // throw too many taps error
                throw TouchEventError.TooManyTapsError
            }
        }
    }
}
