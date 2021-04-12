//
//  BaseViewController.swift
//  CaseStudy
//
//  Created by Eric Shorr on 22/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var mainView:UIView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // loading xib file of the subclass's name and then adding it to self.view from self.mainView
        
        let mainBundle = Bundle.main // the packet of all of the information inside the application such as the storyboard, xibs, pictures, and other multimedia.
        
        if let nibName:String = NSStringFromClass(type(of: self)).components(separatedBy: ".").last
        {
            print(nibName) // printing the sanitized name
            
            mainBundle.loadNibNamed(nibName, owner: self, options: nil) // loading the xib file
            
            if( self.mainView != nil )
            {
                self.mainView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
                
                self.mainView.frame = self.view.bounds
                
                self.view.addSubview(self.mainView)
            }
        }
    }

    func handleError(tile: String?, message: String?)
    {
        let promptController = UIAlertController(title: tile, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
        })
        
        promptController.addAction(ok)
        
        self.present(promptController, animated: true, completion: nil)
    }
}
