//
//  MainViewModel.swift
//  shopping
//
//  Created by CHOI on 7/31/24.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtUsername: String = ""
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isUserLogin: Bool = false
    @Published var user: UserModel = UserModel(userInfo: [:])
    
    init() {
        if(Utils.getUserDefaultBoolean(key: Globs.IS_LOGIN)) {
            self.setUserLogin(userInfo: Utils.getUserDefaultObject(key: Globs.USER_INFO) as? NSDictionary ?? [:])
        }
    }
    
    // MARK: 로그인
    func login() {
        if(txtEmail.isEmpty) {
            print("이메일 미입력")
            self.errorMessage = "이메일을 입력해주세요."
            self.showError = true
            return
        }
        
        if(!txtEmail.isValidEmail) {
            print("이메일 주소 이상")
            self.errorMessage = "이메일 주소를 올바르게 입력해주세요."
            self.showError = true
            return
        }
        
        if(txtPassword.isEmpty) {
            print("비밀번호 미입력")
            self.errorMessage = "비밀번호를 입력해주세요."
            self.showError = true
            return
        }
        
        
        let param: NSDictionary = [
            "email": txtEmail,
            "password": txtPassword
        ];
        
        ServiceCall.post(parameter: param, url: Globs.URL_LOGIN) { response in
            if let response = response as? NSDictionary {
                let status = response.value(forKey: KKey.STATUS) as? String ?? ""
                let message = response.value(forKey: KKey.MESSAGE) as? String ?? ""
                let payload = response.value(forKey: KKey.PAYLOAD) as? NSDictionary ?? [:]
                
                if status == ResponseStatus.SUCCESS.rawValue {
                    self.setUserLogin(userInfo: payload)
                } else {
                    self.errorMessage = message
                    self.showError = true
                }
            }
        } onFailure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }

    }
    
    // MARK: 회원가입
    func signUp() {
        if(txtUsername.isEmpty) {
            print("사용자명 미입력")
            self.errorMessage = "사용자명을 입력해주세요."
            self.showError = true
            return
        }
        
        if(txtEmail.isEmpty) {
            print("이메일 미입력")
            self.errorMessage = "이메일을 입력해주세요."
            self.showError = true
            return
        }
        
        if(!txtEmail.isValidEmail) {
            print("이메일 주소 이상")
            self.errorMessage = "이메일 주소를 올바르게 입력해주세요."
            self.showError = true
            return
        }
        
        if(txtPassword.isEmpty) {
            print("비밀번호 미입력")
            self.errorMessage = "비밀번호를 입력해주세요."
            self.showError = true
            return
        }
        
        
        let param: NSDictionary = [
            "username": txtUsername,
            "email": txtEmail,
            "password": txtPassword
        ];
        
        ServiceCall.post(parameter: param, url: Globs.URL_SIGNUP) { response in
            if let response = response as? NSDictionary {
                let status = response.value(forKey: KKey.STATUS) as? String ?? ""
                let message = response.value(forKey: KKey.MESSAGE) as? String ?? ""
                let payload = response.value(forKey: KKey.PAYLOAD) as? NSDictionary ?? [:]
                
                if status == ResponseStatus.SUCCESS.rawValue {
                    self.setUserLogin(userInfo: payload)
                } else {
                    self.errorMessage = message
                    self.showError = true
                }
            }
        } onFailure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
    }
    
    func setUserLogin(userInfo: NSDictionary) {
        Utils.setUserDefault(key: Globs.USER_INFO, data: userInfo)
        Utils.setUserDefault(key: Globs.IS_LOGIN, data: true)
        
        self.user = UserModel(userInfo: userInfo)
        self.isUserLogin = true
        
        self.txtUsername = ""
        self.txtEmail = ""
        self.txtPassword = ""
        self.isShowPassword = false
    }
}

