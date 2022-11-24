//
//  CreateAccountViewController.swift
//  Coffee Been
//
//  Created by Uladzislau Komar on 20.11.22.
//

import UIKit

class CreateAccountViewController: UIViewController {

   
    //MARK: - Variables
    
    
    
    //MARK: - UIView setups
    
    lazy var labelStack = getLogoStack(textSize: 40)
    lazy var createAccountStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        
        let emptySpace = UILabel()
        emptySpace.text = ""
        
        let firstNameLabel = getLabelForTextField(text: "First name")
        let lastNameLabel = getLabelForTextField(text: "Last name")
        let emailLabel = getLabelForTextField(text: "Email")
        let passLabel = getLabelForTextField(text: "Password")
        
        let firstNameField = getTextField(placeholder: "Enter your first name", height: 40)
        let lastNameField = getTextField(placeholder: "Enter your last name", height: 40)
        let emailField = getTextField(placeholder: "Enter your email", height: 40)
        let passField = getTextField(placeholder: "Enter your password", height: 40)
        
        stackView.addArrangedSubview(firstNameLabel)
        stackView.addArrangedSubview(firstNameField)
        stackView.addArrangedSubview(emptySpace)
        stackView.addArrangedSubview(lastNameLabel)
        stackView.addArrangedSubview(lastNameField)
        stackView.addArrangedSubview(emptySpace)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(emptySpace)
        stackView.addArrangedSubview(passLabel)
        stackView.addArrangedSubview(passField)
        
        return stackView
    }()
    
    lazy var submitButton = getButton(text: "Create account", bgColor: .green, textColor: .white, height: 40, border: false)
    
    //MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        submitButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
    }
    
    //MARK: - Class functions
    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(labelStack)
        view.addSubview(createAccountStack)
        view.addSubview(submitButton)
    }
    
    private func setupConstraints() {
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        
        createAccountStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createAccountStack.topAnchor.constraint(equalTo: labelStack.bottomAnchor, constant: 30),
            createAccountStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            createAccountStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            submitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    //MARK: - objc functions

    @objc func nextScreen(_ sender: UIButton) {
        let nextVC = FinalAccountCreationViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
