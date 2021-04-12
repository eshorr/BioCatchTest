//
//  ViewController.swift
//  BiocatchTest
//
//  Created by Eric Shorr on 11/04/2021.
//

import UIKit

class ViewController: BaseViewController {

}

extension ViewController: TouchEventViewDelegate
{
    func addTouchEvent(touchEvent: TouchEvent) {
        do
        {
            try TouchEventManager.shared.addTapEvent(touchEvent)
        }
        catch TouchEventError.TooFastError
        {
            print("too fast")
            self.handleError(tile: "Error", message: "too fast")
        }
        catch TouchEventError.TooLongError
        {
            print("too long")
            self.handleError(tile: "Error", message: "too long")
        }
        catch TouchEventError.TooManyTapsError
        {
            print("too frequent")
            self.handleError(tile: "Error", message: "too frequent")
        }
        catch
        {
            print("an error occurred")
            self.handleError(tile: "Error", message: "an error occurred")
        }
    }
    
    
}
