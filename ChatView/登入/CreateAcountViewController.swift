//
//  CreateAcountViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/28.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class CreateAcountViewController: UIViewController {
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reCheckPasswordTextField: UITextField!
    
    
    let firebaseUser = FireBaseUserInfo()
    let wrongText = "錯誤警告"
    let successText = "恭喜"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "註冊帳號"
        // Do any additional setup after loading the view.
    }

    @IBAction func createAcountBtnAction(_ sender: Any) {
        if !checkInfoCurrent() {
            return
        }
        guard let emailText = accountTextField.text else {
            return
        }
        guard let passWordText = passwordTextField.text else {
            return
        }
        
        // 帳戶註冊
        firebaseUser.createAccount(newEmail: emailText,
                                   newPassword: passWordText) { (backError, backInfo) -> (Void) in
            if backError == nil{
                DispatchQueue.main.async {
                    self.showAlert(title: self.successText, message: backInfo)
                }
                return
            }
            DispatchQueue.main.async {
                self.showAlert(title: self.wrongText, message: backInfo)
            }
        }
    }
    // 判斷輸入
    func checkInfoCurrent()->Bool{
        guard let accountText = accountTextField.text else {
            return false
        }
        guard let passWordText = passwordTextField.text else {
            return false
        }
        guard let reCheckText = reCheckPasswordTextField.text else {
            return false
        }
        if accountText == "" || passWordText == "" || reCheckText == ""{
            showAlert(title: wrongText, message: "請填入全部資訊！")
            return false
        }
        if (accountText.range(of: "@") == nil) {
            showAlert(title: wrongText, message: "不是信箱格式")
            accountTextField.text = ""
            return false
        }
        if passWordText != reCheckText {
            showAlert(title: wrongText, message: "輸入的密碼不相同")
            passwordTextField.text = ""
            reCheckPasswordTextField.text = ""
            return false
        }
        return true
    }
    // 顯示警告視窗
    func showAlert(title:String,message:String){
        let wrongAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        var okBtn = UIAlertAction()
        // 若是成功 alert button 做些事，否則不做事
        if title == successText {
            okBtn = UIAlertAction.init(title: "ok", style: UIAlertActionStyle.default, handler: { (alertAction) in
                DispatchQueue.main.async {
                    self.leaveSelfViewController()
                }
            })
        }else{
            okBtn = UIAlertAction.init(title: "ok", style: UIAlertActionStyle.cancel, handler:nil)
        }
        wrongAlert.addAction(okBtn)
        self.present(wrongAlert, animated: true, completion: nil)
    }
    // 移除現在的viewController，顯示上個被覆蓋的
    func leaveSelfViewController(){
        guard let selfNaviVC = self.navigationController else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        selfNaviVC.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
