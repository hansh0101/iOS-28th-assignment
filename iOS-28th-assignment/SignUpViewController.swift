//
//  SignUpViewController.swift
//  iOS-28th-assignment
//
//  Created by 한승현 on 1/28/24.
//

import UIKit

class SignUpViewController: UIViewController {
    // ID, Password, Password 확인 TextField 변수
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UI 컴포넌트들을 초기화한다.
        configureUiComponenets()
    }
    
    // UI 컴포넌트를 configure하는 메서드
    private func configureUiComponenets() {
        configureIdTextField()
        configurePasswordTextField()
        configurePasswordConfirmTextField()
    }
    
    // ID TextField를 configure하는 메서드
    private func configureIdTextField() {
        idTextField.placeholder = "이메일 또는 전화번호"
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
    
    // Password 확인 TextField를 configure하는 메서드
    private func configurePasswordConfirmTextField() {
        passwordConfirmTextField.placeholder = "비밀번호 확인"
        passwordConfirmTextField.isSecureTextEntry = true
        passwordConfirmTextField.keyboardType = .default
        passwordConfirmTextField.clearButtonMode = .whileEditing
    }
    
    // ID, Password, Password 확인 입력을 검증하는 메서드
    private func isValidInput() -> Bool {
        // 유효조건 : ID, Password가 비어있지 않고, Password, Password 확인 값이 같음
        return (idTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false) && (passwordTextField.text == passwordConfirmTextField.text)
    }
    
    // 회원가입 버튼 클릭 이벤트 핸들링 메서드
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if (isValidInput()) {
            // WelcomeViewController로 전환 및 ID 데이터 전달
            guard let welcomeVC = self.storyboard?.instantiateViewController(identifier: "WelcomeViewController") as? WelcomeViewController else { return }
            welcomeVC.id = idTextField.text
            self.present(welcomeVC, animated: true, completion: nil)
            
            // 화면 전환 시 Navigation Controller에서 현재 ViewController 제거
            self.navigationController?.popViewController(animated: true)
        }
    }
}
