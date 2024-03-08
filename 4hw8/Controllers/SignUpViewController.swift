//
//  SignUpViewController.swift
//  4hw8
//
//  Created by Telegey Nurbekova on 08/03/24.
//

import UIKit

class SignUpViewController: UIViewController, ValidationProtocol {
    
    private let logoImage = MakerView.shared.makerImage(imageName: "logo2")
    private let nameTF = MakerView.shared.makerTextField(placeholder: "Full Name")
    private let usernameTF = MakerView.shared.makerTextField(placeholder: "Username")
    private let mailTF = MakerView.shared.makerTextField(placeholder: "Email")
    private let passwordTF = MakerView.shared.makerTextField(placeholder: "Password")
    private let eyeButton = MakerView.shared.makerButton(backgroundColor: .clear, image: UIImage(systemName: "eye")?.withRenderingMode(.alwaysTemplate), image2: UIImage(systemName: "eye.slash")?.withRenderingMode(.alwaysTemplate))
    private let signUpBtn = MakerView.shared.makerButton(backgroundColor: .init(hex: "#EF5A5A"), title: "Create Account", titleColor: .white)
    private let dontLabel = MakerView.shared.makerLabel(text: "Already have an account yet?",font:  Fonts.extraLight.size(14), textColor: .gray)
    private let logInBtn = MakerView.shared.makerButton(backgroundColor: .clear, title: "Log in here",titleColor: .darkGray, titleFont: Fonts.regular.size(14))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .white
        
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 110),
            logoImage.widthAnchor.constraint(equalToConstant: 119)
        ])
        
        view.addSubview(nameTF)
        NSLayoutConstraint.activate([
            nameTF.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 40),
            nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameTF.heightAnchor.constraint(equalToConstant: 58)
        ])
        
        view.addSubview(usernameTF)
        NSLayoutConstraint.activate([
            usernameTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 15),
            usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            usernameTF.heightAnchor.constraint(equalToConstant: 58)
        ])
        
        view.addSubview(mailTF)
        NSLayoutConstraint.activate([
            mailTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 15),
            mailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            mailTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            mailTF.heightAnchor.constraint(equalToConstant: 58)
        ])
        
        view.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: mailTF.bottomAnchor, constant: 15),
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
        
        view.addSubview(signUpBtn)
        NSLayoutConstraint.activate([
            signUpBtn.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 34),
            signUpBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        signUpBtn.addTarget(self, action: #selector(signUpBtnTapped), for: .touchUpInside)
        
        view.addSubview(dontLabel)
        NSLayoutConstraint.activate([
            dontLabel.topAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 25),
            dontLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -40)
        ])
        
        view.addSubview(logInBtn)
        NSLayoutConstraint.activate([
            logInBtn.centerYAnchor.constraint(equalTo: dontLabel.centerYAnchor),
            logInBtn.leadingAnchor.constraint(equalTo: dontLabel.trailingAnchor, constant: 5)
        ])
        logInBtn.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
    }
    
    @objc private func logInTapped() {
        let vc = LogInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func signUpBtnTapped() {
        
        let username = usernameTF.text ?? ""
        let name = nameTF.text ?? ""
        let mail = mailTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        let usernameValidation = isValidUsername(username: username)
        let nameValidation = isValidName(name: name)
        let mailValidation = isValidMail(mail: mail)
        let passwordValidation = isValidPassword(password: password)
        
        if usernameValidation.isValid && nameValidation.isValid && mailValidation.isValid && passwordValidation.isValid {
            let vc = MenuViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            if !usernameValidation.isValid {
                usernameTF.text = nil
                usernameTF.layer.borderColor = usernameValidation.borderColor?.cgColor
                usernameTF.placeholder = usernameValidation.placeholder
            }
            if !nameValidation.isValid {
                nameTF.text = nil
                nameTF.layer.borderColor = nameValidation.borderColor?.cgColor
                nameTF.placeholder = nameValidation.placeholder
            }
            if !mailValidation.isValid {
                mailTF.text = nil
                mailTF.layer.borderColor = mailValidation.borderColor?.cgColor
                mailTF.placeholder = mailValidation.placeholder
            }
            if !passwordValidation.isValid {
                passwordTF.text = nil
                passwordTF.layer.borderColor = passwordValidation.borderColor?.cgColor
                passwordTF.placeholder = passwordValidation.placeholder
            }
        }
    }
    
    @objc private func eyeButtonTapped() {
        passwordTF.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
}
