//
//  ViewController.swift
//  iOS-28th-assignment
//
//  Created by 한승현 on 1/27/24.
//

import UIKit

class LoginViewController: UIViewController {
    // ID, Password TextField 변수
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 컴포넌트들을 초기화한다.
        configureUiComponenets()
    }

    // UI 컴포넌트를 configure하는 메서드
    private func configureUiComponenets() {
        configureIdTextField()
        configurePasswordTextField()
    }
    
    // ID TextField를 configure하는 메서드
    private func configureIdTextField() {
        idTextField.placeholder = "이메일 또는 비밀번호"
        idTextField.keyboardType = .default
        idTextField.clearButtonMode = .whileEditing
    }
    
    // Password TextField를 configure하는 메서드
    private func configurePasswordTextField() {
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.keyboardType = .default
        passwordTextField.clearButtonMode = .whileEditing
    }
    
    // ID, Password 입력을 검증하는 메서드
    private func isValidInput() -> Bool {
        // 유효조건 : ID, Password가 비어있지 않음
        return (idTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false)
    }
    
    // Password TextField의 text를 비워내는 메서드
    private func clearPasswordTextField() {
        passwordTextField.text = ""
    }
    
    // 로그인 버튼 클릭 이벤트 핸들링 메서드
    @IBAction func loginButtonClicked(_ sender: Any) {
        if (isValidInput()) {
            // WelcomeViewController로 전환 및 ID 데이터 전달
            guard let welcomeVC = self.storyboard?.instantiateViewController(identifier: "WelcomeViewController") as? WelcomeViewController else { return }
            welcomeVC.id = idTextField.text
            self.present(welcomeVC, animated: true, completion: nil)
            
            // 비밀번호 TextField clear
            clearPasswordTextField()
        }
    }
    
    // 회원가입 버튼 클릭 이벤트 핸들링 메서드
    @IBAction func signUpButtonClicked(_ sender: Any) {
        // SignUpViewController로 전환
        guard let signUpVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else { return }
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
        // 비밀번호 TextField clear
        clearPasswordTextField()
    }
}

