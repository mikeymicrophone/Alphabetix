//
//  Userdefaults.swift
//  TinyCalender
//
//  Created by Taimur imam on 18/10/23.
//  Copyright © 2023 Zero It Solutions. All rights reserved.
//

import Foundation

class Userdefaults{
    
    func saveTheme (theem : Theem_mode ){
        UserDefaults.standard.setValue(theem == .dark ? "dark" : "lite", forKey: "theem")
        UserDefaults.standard.synchronize()
    }
    
    func getSavedTheem ()-> Theem_mode{
        if UserDefaults.standard.value(forKey: "theem") != nil{
            let theem = UserDefaults.standard.value(forKey: "theem") as! String
            return theem == "dark" ? .dark : .lite
         }else{
            return .dark
        }
    }

    func getSavedWord()-> String{
        if UserDefaults.standard.value(forKey: "powerLetter") != nil{
            return UserDefaults.standard.value(forKey: "powerLetter") as! String
        }else{
            return ""
        }
    }
    
    func getSavesWord_informat()-> String
    {
        if UserDefaults.standard.value(forKey: "powerLetter") != nil{
            let word = UserDefaults.standard.value(forKey: "powerLetter") as! String
            return "is \(word)"
        }else
        {
            return "+"
        }
    }
    
}
