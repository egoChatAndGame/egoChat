//
//  JSQChatViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/23.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit
import JSQMessagesViewController
class JSQChatViewController: JSQMessagesViewController {

    let bubbleFactory = JSQMessagesBubbleImageFactory()
    var incomingBubble : JSQMessagesBubbleImage?
    var outgoingBubble : JSQMessagesBubbleImage?
    var userOutgoingAvatar : JSQMessagesAvatarImage?
    var chatterIncomingAvatar : JSQMessagesAvatarImage?
    var messages : [JSQMessage?] = []
    
    var groupRoomBool : Bool = true
    var testOtherUserID = ""
    var testOtherDisplayName = ""
    var testOtherText = "Test Hello."
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 設定使用者的id與名字
        self.senderId = "aaa"
        self.senderDisplayName = "fgfgf"
        
        
        // 設定接收與發送訊息的泡泡
        incomingBubble = bubbleFactory?.incomingMessagesBubbleImage(with: UIColor.jsq_messageBubbleRed())
        outgoingBubble = bubbleFactory?.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleGreen())
        // 給予對話者一個頭像
        chatterIncomingAvatar = JSQMessagesAvatarImageFactory.avatarImage(with: UIImage(named: "設定.png"), diameter: 64)
        userOutgoingAvatar = JSQMessagesAvatarImageFactory.avatarImage(with: UIImage(named: "car.png"), diameter: 64)
        
        // 下兩行可以避免 navigationBar 把view 往下推
//        self.navigationController?.navigationBar.isTranslucent = false
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        
        customerToolbarButton(isGroupRoom: groupRoomBool)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // 新增滑動手勢
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(showGameResult))
        // 設定滑動的起始位址（即由左往右滑）
        swipeRightGesture.direction = UISwipeGestureRecognizerDirection.left
        self.collectionView.addGestureRecognizer(swipeRightGesture)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        // 必須加super，否則輸入框不會隨keyboard 移動
        super.viewDidAppear(true)
        
    }
// Gesture function
    @objc func showGameResult(){
        NSLog("showGameResult")
    }
    
//  JSQmessageController Customer toolbar button
    func customerToolbarButton(isGroupRoom:Bool) {
        if !isGroupRoom {
            return
        }
        // Customer toolBar
        let height = self.inputToolbar.contentView.leftBarButtonContainerView.frame.height
        // 發紅包按鍵製作
        let redEnvelopeBtn = UIButton(frame: CGRect(x: 0, y: 0, width: height, height: height))
        redEnvelopeBtn.setImage(UIImage(named: "RedEnvelope.png"), for: UIControlState.normal)
        redEnvelopeBtn.addTarget(self, action: #selector(redEnvelopeBtnAction(sender:)),
                                for: UIControlEvents.touchUpInside)
        // 下注鍵製作
        let bettingBtn = UIButton(frame: CGRect(x: height+5, y: 0, width: height, height: height))
        bettingBtn.setTitle("下注", for: UIControlState.normal)
        bettingBtn.backgroundColor = UIColor.green
        bettingBtn.addTarget(self, action: #selector(bettingBtnAction(sender:)),
                             for: UIControlEvents.touchUpInside)
        
        // 計算 barButtons 所佔的空間寬度
        let leftBarBtns = [redEnvelopeBtn,bettingBtn]
        let leftBarBtnCount : CGFloat = CGFloat(leftBarBtns.count)
        // 改變 leftBarButton 的總寬，會連帶影響到輸入框
        self.inputToolbar.contentView.leftBarButtonItemWidth = (height*leftBarBtnCount)+5*(leftBarBtnCount-1)+1
        // 將 barButtons 加入leftBarbuttonView的區域中
        let leftBarView = self.inputToolbar.contentView.leftBarButtonContainerView
        leftBarView?.addSubview(redEnvelopeBtn)
        leftBarView?.addSubview(bettingBtn)
        
        // 把原本的 leftBarButtonItem 隱藏避免觸發到
        self.inputToolbar.contentView.leftBarButtonItem.isHidden = true
    }
    @objc func redEnvelopeBtnAction(sender:UIButton){
        self.inputToolbar.contentView.textView.resignFirstResponder()
        NSLog("redEnvelopeBtnAction")
    }
    @objc func bettingBtnAction(sender:UIButton){
        self.inputToolbar.contentView.textView.resignFirstResponder()
        NSLog("bettingBtnAction")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: 模擬接收訊息
    func receiveAutoMessage() {
        //觸發一秒後發送訊息模擬是對方發送
        let laterOneSec = DispatchTime.now()+1
        DispatchQueue.main.asyncAfter(deadline: laterOneSec) {
            self.didFinishMessageTimer()
        }
    }
    // 接收訊息與發送訊息的方法
    @objc func didFinishMessageTimer(){
        // 播放收到訊息的效果音
        JSQSystemSoundPlayer.jsq_playMessageReceivedSound()
        // 建立要回傳訊息的資訊
        let sendBackMsg = JSQMessage(senderId: testOtherUserID,
                                     displayName: testOtherDisplayName,
                                     text: testOtherText)
        messages.append(sendBackMsg)
        //處理完接收訊息後必須呼叫該方法，該方法會做一些畫面處理及更新資料，填入的參數是用來決定將畫面移動到最下面是否要動畫
        self.finishReceivingMessage(animated: true)
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
// MARK: -JSQMessagesViewController datasource and delegate function
extension JSQChatViewController{
    //點擊發送訊息鈕時，會觸發該方法
    override func didPressSend(_ button: UIButton,
                               withMessageText text: String,
                               senderId: String,
                               senderDisplayName: String,
                               date: Date) {
        //發送訊息時使用預設音(選用)
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        
        //將必要資訊包裝成一個訊息物件
        let message = JSQMessage(senderId: self.senderId,
                                 senderDisplayName: self.senderDisplayName,
                                 date: Date(),
                                 text: text)
        
        messages.append(message)
        //處理完發送訊息後必須呼叫該方法，該方法會做一些畫面處理及更新資料，填入的參數是用來決定將畫面移動到最下面是否要動畫
        self.finishSendingMessage(animated: true)
        
        
        //以下方法跟上面相同，差別是將畫面移動到最下面是有動畫的
        //self.finishSendingMessage()
        
        //模擬收到訊息用
        receiveAutoMessage()
    }
    //下方功能鍵
    // 若自訂 leftBarButton 這個功能就不會被觸發
    override func didPressAccessoryButton(_ sender: UIButton!) {
        self.inputToolbar.contentView.textView.resignFirstResponder()
        let sheetAlert = UIAlertController(title: "Media messages",
                                           message: nil,
                                           preferredStyle: UIAlertControllerStyle.actionSheet)
        let sendPhoto = UIAlertAction.init(title: "傳送圖片", style: UIAlertActionStyle.default) { (action) in
            NSLog("傳送圖片")
        }
        let cancel = UIAlertAction(title: "cancel",
                                   style: UIAlertActionStyle.cancel,
                                   handler: nil)
        sheetAlert.addAction(sendPhoto)
        sheetAlert.addAction(cancel)
        
        
        // sheet alert 在ipad 上要避免的問題，不加這行下兩行會當
        sheetAlert.popoverPresentationController?.sourceView = self.view
        sheetAlert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.maxY, width: 100, height: 100)
        
        self.present(sheetAlert, animated: true, completion: nil)
    }
    // MARK: - JSQMessagesViewController DataSource Function
    /*
     func senderDisplayName() -> String? {
     return ""
     }
     */
    /*
     func senderId() -> String? {
     return ""
     }
     */
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView?,
                                 messageDataForItemAt indexPath: IndexPath) -> JSQMessageData? {
        return messages[indexPath.item]
    }
    /*
     // 刪除message
     override func collectionView(_ collectionView: JSQMessagesCollectionView?,
     didDeleteMessageAt indexPath: IndexPath) {
     
     }
     */
    // 回傳與告知對話框的顏色
    //Q: 若出錯，回傳值可考慮改成JSQMessageBubbleImageDataSource，不在可回傳nil
    override func collectionView(_ collectionView: JSQMessagesCollectionView,
                                 messageBubbleImageDataForItemAt indexPath: IndexPath) -> JSQMessageBubbleImageDataSource? {
        let message = messages[indexPath.row]
        guard let sendId = message?.senderId else {
            return nil
        }
        if sendId == self.senderId {
            return outgoingBubble
        }
        return incomingBubble
    }
    
    // 使用者與聊天者的頭像
    //Q: 若出錯，回傳值可考慮改成JSQMessageAvatarImageDataSource，不在可回傳nil
    override func collectionView(_ collectionView: JSQMessagesCollectionView?,
                                 avatarImageDataForItemAt indexPath: IndexPath) -> JSQMessageAvatarImageDataSource? {
        let message = messages[indexPath.row]
        guard let sendId = message?.senderId else {
            return nil
        }
        if sendId == self.senderId {
            return userOutgoingAvatar
        }
        return chatterIncomingAvatar
    }
    // 顯示時間戳
    override func collectionView(_ collectionView: JSQMessagesCollectionView?,
                                 attributedTextForCellTopLabelAt indexPath: IndexPath) -> NSAttributedString? {
        if indexPath.row % 3 == 0{
            guard let message = messages[indexPath.row] else{
                return nil
            }
            /**
             *  設定條件顯示時間戳，此例是以每三次就顯示一條時間戳
             *  不想顯示則return nil
             */
            let time = JSQMessagesTimestampFormatter.shared().attributedTimestamp(for: message.date)
            return time
        }
        return nil
    }
    // 顯示發訊息者的名字
    override func collectionView(_ collectionView: JSQMessagesCollectionView,
                                 attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath) -> NSAttributedString? {
        guard let message = messages[indexPath.item] else {
            return nil
        }
        // 拿到發訊息者的名字
        let senderName = NSAttributedString(string: message.senderDisplayName)
        
        // 判斷訊息的Id 是否為使用者的Id
        if message.senderId == self.senderId {
            return nil
            //            return senderName
        }
        return senderName
    }
    //泡泡框下面還有一塊UILabel空間，這個方法是決定那塊UILabel要顯示什麼
    override func collectionView(_ collectionView: JSQMessagesCollectionView,
                                 attributedTextForCellBottomLabelAt indexPath: IndexPath) -> NSAttributedString? {
        return nil
    }
    // MARK: -設定各個Lable 的高度
    // chat bubble 上方 label(Cell上) 的高度
    override func collectionView(_ collectionView: JSQMessagesCollectionView,
                                 layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout,
                                 heightForCellTopLabelAt indexPath: IndexPath) -> CGFloat {
        /**
         *  不想顯示高度填0
         */
        if indexPath.item % 3 == 0 {
            return kJSQMessagesCollectionViewCellLabelHeightDefault
        }
        return 0.0
    }
    // 決定名字 UILabel (bubble上Label)的高度
    override func collectionView(_ collectionView: JSQMessagesCollectionView,
                                 layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout,
                                 heightForMessageBubbleTopLabelAt indexPath: IndexPath) -> CGFloat {
        /**
         *  不想顯示高度填0
         */
        guard let message = messages[indexPath.item] else {
            return 0.0
        }
        guard let sendId = message.senderId else {
            return 0.0
        }
        if sendId == self.senderId {
            return kJSQMessagesCollectionViewCellLabelHeightDefault
        }
        return kJSQMessagesCollectionViewCellLabelHeightDefault
    }
    // 泡泡框下方的Label 的高度
    func collectionView(_ collectionView: JSQMessagesCollectionView, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout, heightForMessageBubbleBottomLabelAt indexPath: IndexPath) -> CGFloat {
        return 0.0
    }
    
    
    //MARK: - Delegate Dunction
    override func collectionView(_ collectionView: JSQMessagesCollectionView, header headerView: JSQMessagesLoadEarlierHeaderView, didTapLoadEarlierMessagesButton sender: UIButton) {
        NSLog("讀取較早的訊息")
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView, didTapAvatarImageView avatarImageView: UIImageView, at indexPath: IndexPath) {
        NSLog("點擊頭像時要做的事")
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView, didTapMessageBubbleAt indexPath: IndexPath) {
        NSLog("點到對話框時的方法")
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView, didTapCellAt indexPath: IndexPath, touchLocation: CGPoint) {
        NSLog("現在觸碰到 \(touchLocation) 座標")
    }
    
}
