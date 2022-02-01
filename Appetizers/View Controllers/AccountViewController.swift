//
//  AccountViewController.swift
//  Appetizers
//
//  Created by APPS2T on 10/12/21.
//

import UIKit

class AccountViewController: UIViewController {

    
    
    @IBOutlet weak var firstnameUser: UITextField!
    @IBOutlet weak var refillsUser: UISwitch!
    @IBOutlet weak var napkinsUser: UISwitch!
    @IBOutlet weak var emailUser: UITextField!
    @IBOutlet weak var lastnameUser: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    let userDefaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "😃 Account"
        self.tabBarItem.title = "Account"
        birthdatePicker.datePickerMode = .date
        birthdatePicker.tintColor = .black
        
        if let nameValue = userDefaults.string(forKey: "usernameKey") {
            firstnameUser.text = nameValue
        }
        if let lastnameValue = userDefaults.string(forKey: "lastnameKey") {
            lastnameUser.text = lastnameValue
        }
        if let emailValue = userDefaults.string(forKey: "emailKey") {
            emailUser.text = emailValue
        }
        
        refillsUser.isOn = userDefaults.value(forKey: "refillsKey") as? Bool ?? false
        napkinsUser.isOn = userDefaults.value(forKey: "napkinsKey") as? Bool ?? false
        
        if let date = userDefaults.object(forKey: "birthdate") as? Date {
            birthdatePicker.date = date
        }else{}
    }
    
    
    
  
    
    @IBAction func saveData(_ sender: Any) {
        
        let nameValue = firstnameUser.text
        if let namevalueExist = nameValue {
            userDefaults.set(nameValue, forKey: "usernameKey")
        }
        let lastnameValue = lastnameUser.text
        if let lastnamevalueExist = lastnameValue {
            userDefaults.set(lastnameValue, forKey: "lastnameKey")
        }
        let emailValue = emailUser.text
        if let emailvalueExist = emailValue {
            userDefaults.set(emailValue, forKey: "emailKey")
        }
        
        userDefaults.set(birthdatePicker.date, forKey: "birthdate")
        
        
    
    }
    
    
    @IBAction func napkinsTap(_ sender: UISwitch) {
        
        userDefaults.set(sender.isOn, forKey: "napkinsKey")
    }
    
    

    @IBAction func refilsTap(_ sender: UISwitch) {
        userDefaults.set(sender.isOn, forKey: "refillsKey")
    }
}

