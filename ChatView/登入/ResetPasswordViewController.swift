//
//  ResetPasswordViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/29.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var resetEmailTextField: UITextField!
    let firebaseUser = FireBaseUserInfo()
    let wrongText = "錯誤"
    let successText = "成功"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func resetPswBtnAction(_ sender: Any) {
        guard let emailText = resetEmailTextField.text else {
            return
        }
        if resetEmailTextField.text == "" || (emailText.range(of: "@") == nil) {
            self.showAlert(title: wrongText, message: "請輸入正確得電子郵件")
            return
        }
        // 寄送重設密碼的信件
        firebaseUser.sendResetEmail(restEmail: emailText) { (resetError, resetInfo) -> (Void) in
            if resetError == nil {
                self.showAlert(title: self.successText, message: resetInfo)
                self.resetEmailTextField.text = ""
                return
            }
            self.showAlert(title: self.wrongText, message: resetInfo)
        }
    }
    
    func showAlert(title:String,message:String){
        let wrongAlert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okBtn = UIAlertAction.init(title: "確認", style: UIAlertActionStyle.cancel, handler: nil)
        wrongAlert.addAction(okBtn)
        self.present(wrongAlert, animated: true, completion: nil)
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
