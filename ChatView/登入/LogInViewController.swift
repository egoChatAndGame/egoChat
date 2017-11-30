//
//  LogInViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/28.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let fireBaseUser = FireBaseUserInfo()
    let wrongText = "wrong"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登入頁面"
        firebaseLogOut()
        let logOutBarBtn = UIBarButtonItem(title: "登出", style: UIBarButtonItemStyle.done, target: self, action: #selector(firebaseLogOut))
        self.navigationItem.rightBarButtonItem = logOutBarBtn
        
        
    }
// Button action Function
    @IBAction func logButtonAction(_ sender: Any) {
        if accountTextField.text == "" || passwordTextField.text == "" {
            showAlert(title: wrongText, message: "帳號或密碼忘記輸入")
            return
        }
        guard let accountText = accountTextField.text else {
            return
        }
        guard let passWordText = passwordTextField.text else {
            return
        }
        fireBaseUser.login(email: accountText,
                           password: passWordText) { (backError, backInfo) in
            if backError == nil{
                // 若無錯誤即登入成功，跳到主頁面
                DispatchQueue.main.async {
                    self.showMainViewController()
                }
                return
            }
            // 失敗顯示錯誤訊息警告視窗
            DispatchQueue.main.async {
                self.showAlert(title: self.wrongText, message: backInfo)
            }
        }
    }
    // 跳到建立帳號頁面
    @IBAction func createAccountBtnAction(_ sender: Any) {
        guard let creatAcountVC = storyboard?.instantiateViewController(withIdentifier: "CreateAcountViewController") as? CreateAcountViewController else {
            return
        }
        self.navigationController?.pushViewController(creatAcountVC, animated: true)
    }
//  重設密碼頁面
    @IBAction func showResetVCBtnAction(_ sender: Any) {
        guard let resetPage = storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as? ResetPasswordViewController else {
            return
        }
        self.navigationController?.pushViewController(resetPage, animated: true)
    }
//  Firebase 登出
    @objc func firebaseLogOut(){
        fireBaseUser.logOut { (backError, backInfo) -> (Void) in
            if backError == nil {
                NSLog("backInfo:\(backInfo)")
                return
            }
            DispatchQueue.main.async {
                self.showAlert(title: self.wrongText, message: backInfo)
            }
        }
    }
    // 警告視窗，只有確認
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let console = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(console)
        self.present(alert, animated: true, completion: nil)
    }
    // 顯示主畫面
    @objc func showMainViewController(){
        guard let mainViewController = storyboard?.instantiateViewController(withIdentifier: "TotalTabBarViewController") as? TotalTabBarViewController else{
            return
        }
        self.present(mainViewController, animated: true, completion: nil)
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
