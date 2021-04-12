//
//  UITouch+Extension.swift
//  BiocatchTest
//
//  Created by Eric Shorr on 11/04/2021.
//

import Foundation
import UIKit

public extension UITouch
{
    func velocity(view: UIView?, timeinterval: TimeInterval) -> CGPoint
    {
        let newLocation = self.location(in: view)
        let prevLocation = self.previousLocation(in: view)
        
        let xSpeed = (newLocation.x - prevLocation.x) / CGFloat(timeinterval)
        let ySpeed = (newLocation.y - prevLocation.y) / CGFloat(timeinterval)
        
        return CGPoint(x: xSpeed, y: ySpeed)
    }
}
