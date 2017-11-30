//
//  FriendChatTableViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/13.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit

class FriendChatTableViewController: UITableViewController {

    let allFriend : [String] = ["a","b","c","d","e","f","g","h"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "好友"
        let addFriendBarBtn = UIBarButtonItem(title: "新增好友", style: UIBarButtonItemStyle.done, target: self, action: #selector(addFriendBarBtnAction(sender:)))
        self.navigationItem.rightBarButtonItem = addFriendBarBtn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// MARK: - some UI action
    @objc func addFriendBarBtnAction(sender:UIBarButtonItem){
        
    }
// MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allFriend.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let friendCell = cell as? FriendTableViewCell else {
            return cell
        }
        friendCell.friendName.text = allFriend[indexPath.row]
        friendCell.friendImageView.image =  UIImage(named: "Unknown.jpg")
        // Configure the cell...
        return friendCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 準備聊天室畫面
        guard let chatViewController = storyboard?.instantiateViewController(withIdentifier: "JSQChatViewController") as? JSQChatViewController else{
            return
        }
        chatViewController.testOtherUserID = allFriend[indexPath.row]
        chatViewController.testOtherDisplayName = allFriend[indexPath.row]
        chatViewController.title = allFriend[indexPath.row]
        chatViewController.groupRoomBool = false
        // 隱藏tapBar
        chatViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
