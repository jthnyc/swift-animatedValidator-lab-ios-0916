//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    var isTrue = true
    var counter = 0
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!


    @IBOutlet weak var submitButtonHeightConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
    }
    
    
    
    
    @IBAction func emailText(_ sender: AnyObject) {

        if (emailTextField.text?.contains("@"))! && (emailTextField.text?.contains("."))! {
            UITextField.animate(withDuration: 0.5, animations:{
                self.emailTextField.backgroundColor = UIColor.clear
                self.counter += 1
                self.enableButton()
            })
        } else {
            UITextField.animate(withDuration: 0.5, animations: {
                self.emailTextField.backgroundColor = UIColor.red
                self.isTrue = false
            })
        }

    }
   
    

    @IBAction func confirmEmail(_ sender: AnyObject) {
        if emailConfirmationTextField.text! == emailTextField.text! {
            UITextField.animate(withDuration: 0.5, animations:{
                self.emailConfirmationTextField.backgroundColor = UIColor.clear
                self.counter += 1
                
            })
        } else {
            UITextField.animate(withDuration: 0.5, animations: {
                self.emailConfirmationTextField.backgroundColor = UIColor.red
                self.isTrue = false
            })
            
        }
        
    }
    
    
    
    @IBAction func phoneText(_ sender: AnyObject) {
        if Int((phoneTextField.text?.characters.count)!) == 7 {
            UITextField.animate(withDuration: 0.5, animations: {
                self.phoneTextField.backgroundColor = UIColor.clear
                self.counter += 1
                
            })
        } else if (phoneTextField.text?.characters.count)! < 7{
            UITextField.animate(withDuration: 0.5, animations: {
                self.phoneTextField.backgroundColor = UIColor.red
                self.isTrue = false
            })
        } else {
            UITextField.animate(withDuration: 0.5, animations: {
                self.phoneTextField.backgroundColor = UIColor.red
                self.isTrue = false
            })
        }

    }
    

    @IBAction func passwordText(_ sender: AnyObject) {
        if (passwordTextField.text?.characters.count)! >= 6 {
            UITextField.animate(withDuration: 0.5, animations: {
                self.passwordTextField.backgroundColor = UIColor.clear
                self.counter += 1
                
            })
        } else {
            UITextField.animate(withDuration: 0.5, animations: {
                self.passwordTextField.backgroundColor = UIColor.red
                self.isTrue = false
            })
        }

    }
    
    
    @IBAction func confirmPassword(_ sender: AnyObject) {
        if passwordTextField.text == passwordConfirmTextField.text {
            UITextField.animate(withDuration: 0.5, animations:{
                self.passwordConfirmTextField.backgroundColor = UIColor.clear
                self.counter += 1
                self.enableButton()
            })
        } else {
            UITextField.animate(withDuration: 0.5, animations: {
                self.passwordConfirmTextField.backgroundColor = UIColor.red
                self.isTrue = false
            })
            
        }

    }

    
    
    
    func enableButton () {
        if counter == 5 {
        self.submitButton.isEnabled = true
        }
//        self.submitButtonHeightConstraint.constant = 20

    }
   
    @IBAction func submitPushed(_ sender: AnyObject) {
        emailTextField.text = ""
        emailConfirmationTextField.text = ""
        phoneTextField.text = ""
        passwordTextField.text = ""
        passwordConfirmTextField.text = ""
        
    }
    
    
    
}



    

