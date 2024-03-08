//
//  LogInViewController.swift
//  4hw8
//
//  Created by Telegey Nurbekova on 08/03/24.
//

import UIKit

class LogInViewController: UIViewController, ValidationProtocol {
    
    private let logoImage = MakerView.shared.makerImage(imageName: "logo2")
    private let usernameTF = MakerView.shared.makerTextField(placeholder: "Username")
    private let passwordTF = MakerView.shared.makerTextField(placeholder: "Password")
    private let eyeButton = MakerView.shared.makerButton(backgroundColor: .clear, image: UIImage(systemName: "eye")?.withRenderingMode(.alwaysTemplate), image2: UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysTemplate))
    private let logInBtn = MakerView.shared.makerButton(backgroundColor: .init(hex: "#EF5A5A"), title: "Log In", titleColor: .white)
    private let dontLabel = MakerView.shared.makerLabel(text: "Don't you have an account yet?",font:  Fonts.extraLight.size(14), textColor: .gray)
    private let signUpBtn = MakerView.shared.makerButton(backgroundColor: .clear, title: "Sign up here",titleColor: .darkGray, titleFont: Fonts.regular.size(14))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 128),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 174),
            logoImage.widthAnchor.constraint(equalToConstant: 188)
        ])
        
        view.addSubview(usernameTF)
        NSLayoutConstraint.activate([
            usernameTF.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 30),
            usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            usernameTF.heightAnchor.constraint(equalToConstant: 58)
        ])
        
        view.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 15),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTF.heightAnchor.constraint(equalToConstant: 58)
        ])
        
        eyeButton.tintColor = UIColor.lightGray
        view.addSubview(eyeButton)
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: passwordTF.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor, constant: -8),
            eyeButton.widthAnchor.constraint(equalToConstant: 25),
            eyeButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        eyeButton.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        
        view.addSubview(logInBtn)
        NSLayoutConstraint.activate([
            logInBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 40),
            logInBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logInBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            logInBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        logInBtn.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        
        view.addSubview(dontLabel)
        NSLayoutConstraint.activate([
            dontLabel.topAnchor.constraint(equalTo: logInBtn.bottomAnchor, constant: 25),
            dontLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -40)
        ])
        
        view.addSubview(signUpBtn)
        NSLayoutConstraint.activate([
            signUpBtn.centerYAnchor.constraint(equalTo: dontLabel.centerYAnchor),
            signUpBtn.leadingAnchor.constraint(equalTo: dontLabel.trailingAnchor, constant: 5)
        ])
        signUpBtn.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
    }
    
    @objc private func logInTapped() {
        let username = usernameTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        let usernameValidation = isValidUsername(username: username)
        let passwordValidation = isValidPassword(password: password)
        
        if usernameValidation.isValid && passwordValidation.isValid {
            let vc = MenuViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            if !usernameValidation.isValid {
                usernameTF.text = nil
                usernameTF.layer.borderColor = usernameValidation.borderColor?.cgColor
                usernameTF.placeholder = usernameValidation.placeholder
            }
            if !passwordValidation.isValid {
                passwordTF.text = nil
                passwordTF.layer.borderColor = passwordValidation.borderColor?.cgColor
                passwordTF.placeholder = passwordValidation.placeholder
            }
        }
    }
    
    @objc private func signUpBtnTapped() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func eyeButtonTapped() {
        passwordTF.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}

