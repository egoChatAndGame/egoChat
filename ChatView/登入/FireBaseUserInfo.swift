//
//  FireBaseUserInfo.swift
//  ChatView
//
//  Created by Uran on 2017/11/30.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FireBaseUserInfo: NSObject {
    typealias completedHandle = (Error?,String)->(Void)
    func checkLogin()->Bool{
        if Auth.auth().currentUser == nil {
            return false
        }
        return true
    }
    // Firebase 登入
    func login(email:String,
               password:String,
               completeInfo: @escaping completedHandle){
        Auth.auth().signIn(withEmail: email,
                           password: password) { (user, logError) in
            guard let error = logError else{
                completeInfo(logError,"登入成功")
                return
            }
            guard let errorMsg = logError?.localizedDescription else{
                completeInfo(error,"登入失敗")
                return
            }
            completeInfo(error,errorMsg)
        }
    }
    // Firebase 登出
    func logOut(completed:completedHandle){
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                completed(nil,"登出成功")
            } catch {
                let errorMsg = error.localizedDescription
                completed(error,errorMsg)
            }
        }
    }
    // Firebase 建立帳號
    func createAccount(newEmail:String,
                       newPassword:String,
                       completed:@escaping completedHandle){
        Auth.auth().createUser(withEmail: newEmail,
                               password: newPassword) { (user, createError) in
            guard let error = createError else{
                completed(createError,"註冊成功")
                return
            }
            let errorMsg = error.localizedDescription
            completed(error,errorMsg)
        }
    }
    // 傳送 Email 重設密碼
    func sendResetEmail(restEmail:String,
                        completed:@escaping completedHandle){
        Auth.auth().sendPasswordReset(withEmail: restEmail,
                                      completion: { (resetError) in
            guard let error = resetError else{
                completed(resetError,"信件已寄送，請到信箱查收，謝謝")
                return
            }
            completed(error,"信箱可能輸入錯誤，請再次確認")
        })
    }
    
}
