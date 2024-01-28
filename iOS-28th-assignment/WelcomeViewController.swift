//
//  WelcomeViewController.swift
//  iOS-28th-assignment
//
//  Created by 한승현 on 1/28/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    // 로그인, 회원가입 화면에서 받아와 띄워줄 ID 변수
    var id : String?
    // 환영 문구 Label 변수
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // UI 컴포넌트들을 초기화한다.
        configureUiComponenets()
    }
    
    // UI 컴포넌트를 configure하는 메서드
    private func configureUiComponenets() {
        configureWelcomeLabel()
    }
    
    // 환영 문구 Label를 configure하는 메서드
    private func configureWelcomeLabel() {
        welcomeLabel.textAlignment = .center
        
        if let idValue = id {
            welcomeLabel.text = "\(idValue)님\n\n환영합니다"
        }
    }
    
    // 확인 버튼 클릭 이벤트 핸들링 메서드
    @IBAction func okButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
