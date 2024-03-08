//
//  ViewController.swift
//  4hw8
//
//  Created by Telegey Nurbekova on 08/03/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let logoImage = MakerView.shared.makerImage(imageName: "logo")
    private let welcomeLabel = MakerView.shared.makerLabel(text: "Welcome", font: Fonts.semiBold.size(42))
    private let podLabel = MakerView.shared.makerLabel(text: "Read without limits")
    private let createAccountBtn = MakerView.shared.makerButton(title: "Create Account")
    private let logInBtn = MakerView.shared.makerButton(backgroundColor: .clear, title: "Log In", titleColor: .white, borderWidth: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        
        view.backgroundColor = .init(hex: "#EF5A5A")
        
        view.addSubview(logoImage)
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 213),
            logoImage.widthAnchor.constraint(equalToConstant: 232)
        ])
        
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 35),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(podLabel)
        NSLayoutConstraint.activate([
            podLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 15),
            podLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(createAccountBtn)
        NSLayoutConstraint.activate([
            createAccountBtn.topAnchor.constraint(equalTo: podLabel.bottomAnchor, constant: 25),
            createAccountBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            createAccountBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            createAccountBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        createAccountBtn.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
        
        view.addSubview(logInBtn)
        NSLayoutConstraint.activate([
            logInBtn.topAnchor.constraint(equalTo: createAccountBtn.bottomAnchor, constant: 10),
            logInBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logInBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logInBtn.heightAnchor.constraint(equalToConstant: 50)
        ])
        logInBtn.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
    }
    
    @objc private func createTapped() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func logInTapped() {
        let vc = LogInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    


}

