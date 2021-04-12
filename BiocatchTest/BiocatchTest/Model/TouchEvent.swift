//
//  TouchEvent.swift
//  BiocatchTest
//
//  Created by Eric Shorr on 11/04/2021.
//

import Foundation
import UIKit

@objc class TouchEvent: NSObject
{
    let timestamp:TimeInterval
    var tapDuration:TimeInterval = 0.0
    var maxSwipeVelocity:CGFloat = 0.0
    
    init(timestamp:TimeInterval)
    {
        self.timestamp = timestamp
    }
}
