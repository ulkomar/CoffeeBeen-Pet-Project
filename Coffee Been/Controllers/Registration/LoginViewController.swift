//
//  LoginViewController.swift
//  Coffee Been
//
//  Created by Uladzislau Komar on 14.11.22.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Variables
    
    
    
    //MARK: - UIView setups
    
    lazy var labelStack: UIStackView = getLogoStack(textSize: 35)
    
    lazy var loginStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        let space = UILabel()
        
        let emailLabel = getLabelForTextField(text: "Email")
        
        let passLabel = getLabelForTextField(text: "Password")
        
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(space)
        stackView.addArrangedSubview(passLabel)
        stackView.addArrangedSubview(passTextField)
        
        return stackView
    }()
    
    lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        let createAccountButton: UIButton = getButton(text: "Create Account", bgColor: .white, textColor: .black, height: 50, border: true)
        let signInButton: UIButton = getButton(text: "Sign In", bgColor: .green, textColor: .white, height: 50, border: false)
        
        createAccountButton.addTarget(nil, action: #selector(createAccount), for: .touchUpInside)
        
        stackView.addArrangedSubview(createAccountButton)
        stackView.addArrangedSubview(signInButton)
        
        return stackView
    }()
    
    lazy var emailTextField: UITextField = getTextField(placeholder: "Enter email", height: 40)
    
    lazy var passTextField: UITextField = getTextField(placeholder: "Enter Password", height: 40, secureField: true)
    
    
    //MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
    //MARK: - Class functions
    
    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(labelStack)
        view.addSubview(loginStack)
        view.addSubview(buttonStack)
        
    }
    
    private func setupConstraints() {
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            labelStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginStack.topAnchor.constraint(equalTo: labelStack.bottomAnchor, constant: 70),
            loginStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
         
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            buttonStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    
    //MARK: - objc functions

    @objc func createAccount(_ sender: UIButton) {
        print("Hello")
        let nextScreen = CreateAccountViewController()
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
}
