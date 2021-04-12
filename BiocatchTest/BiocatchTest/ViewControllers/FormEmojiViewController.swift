//
//  FormEmojiViewController.swift
//  EmojiDictionary
//
//  Created by Eric Shorr on 30/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class FormEmojiViewController: BaseViewController,UITextFieldDelegate {
    
    @IBAction func save(_ sender: Any?)
    {
        // to be over written
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let linkedTextField : LinkedTextField = textField as? LinkedTextField
        {
            if( linkedTextField.nextField != nil )
            {
                linkedTextField.nextField?.becomeFirstResponder()
            }
            else
            {
                linkedTextField.resignFirstResponder()
                self.save(nil)
            }
        }
        
        return true
    }
}
