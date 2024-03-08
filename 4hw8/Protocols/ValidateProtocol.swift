//
//  ValidateProtocol.swift
//  4hw8
//
//  Created by Telegey Nurbekova on 08/03/24.
//

import UIKit

protocol ValidationProtocol {
    func isValidUsername(username: String) -> (isValid: Bool, borderColor: UIColor?, placeholder: String)
    func isValidPassword(password: String) -> (isValid: Bool, borderColor: UIColor?, placeholder: String)
}

extension ValidationProtocol {
    
    func isValidUsername(username: String) -> (isValid: Bool, borderColor: UIColor?, placeholder: String) {
        let isValid = username.count >= 5
        if isValid {
            return (true, nil, "Username")
        } else {
            return (false, .red, "Username should be at least 5 characters")
        }
    }
    
    func isValidPassword(password: String) -> (isValid: Bool, borderColor: UIColor?, placeholder: String) {
        let isValid = password.count >= 8
        if isValid {
            return (true, nil, "Password")
        } else {
            return (false, .red, "Password should be at least 8 characters")
        }
    }
    
    func isValidName(name: String) -> (isValid: Bool, borderColor: UIColor?, placeholder: String) {
        let isValid = name.count >= 4
        if isValid {
            return (true, nil, "Name")
        } else {
            return (false, .red, "Enter your full name, please")
        }
    }
    
    func isValidMail(mail: String) -> (isValid: Bool, borderColor: UIColor?, placeholder: String) {
        let isValid = mail.count >= 10
        if isValid {
            return (true, nil, "Email")
        } else {
            return (false, .red, "Enter your valid email, please")
        }
    }
}

