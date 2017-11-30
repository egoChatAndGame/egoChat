//
//  GameChatRoomViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/24.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit

class GameChatRoomViewController: UIViewController {
    
    var viewControllerTitle = ""
    let section = ["Public", "Private"]
    var items = [["public 0", "public 1", "public 2"], ["Private 0", "Private 1", "Private 2"]]
    var gameRuleViewShowing : Bool = false
    var gameRuleCoverView = UIView()
    var gameRuleText = "【原文】先帝慮漢、賊不兩立，王業不偏安，故托臣以討賊也。以先帝之明，量臣之才，故知臣伐賊，才弱敵強也。然不伐賊，王業亦亡。惟坐而待亡，孰與伐之？是故托臣而弗疑也。臣受命之日，寢不安席，食不甘味；思惟北征，宜先入南：故五月渡瀘，深入不毛，並日而食。臣非不自惜也，顧王業不可偏安於蜀都，故冒危難以奉先帝之遺意。而議者謂為非計。今賊適疲於西，又務於東，兵法乘勞，此進趨之時也。謹陳其事如左：高帝明並日月，謀臣淵深，然涉險被創，危然後安；今陛下未及高帝，謀臣不如良、平，而欲以長策取勝，坐定天下，此臣之未解一也。劉繇、王朗，各據州郡，論安言計，動引聖人，群疑滿腹，眾難塞胸；今歲不戰，明年不征，使孫策坐大，遂並江東，此臣之未解二也。曹操智計，殊絕於人，其用兵也，仿怫孫、吳，然困於南陽，險於烏巢，危于祁連，逼于黎陽，幾敗北山，殆死潼關，然後偽定一時耳；況臣才弱，而欲以不危而定之，此臣之未解三也。曹操五攻昌霸不下，四越巢湖不成，任用李服而李服圖之，委任夏侯而夏侯敗亡，先帝每稱操為能，猶有此失；況臣弩下，何能必勝？此臣之未解四也。自臣到漢中，中間期年耳，然喪趙雲、陽群、馬玉、閻芝、丁立、白壽、劉合、鄧銅等，及驅長屯將七十餘人，突將無前，叢叟、青羌，散騎武騎一千餘人，此皆數十年之內，所糾合四方之精銳，非一州之所有；若複數年，則損三分之二也，當何以圖敵？此臣之未解五也。今民窮兵疲，而事不可息；事不可息，則住與行，勞費正等；而不及今圖之，欲以一州之地，與賊持久，此臣之未解六也。夫難平者，事也。昔先帝敗軍于楚，當此時，曹操拊手，謂天下已定。然後先帝東連吳、越，西取巴、蜀，舉兵北征，夏侯授首：此操之失計，而漢事將成也。然後吳更違盟，關羽毀敗，秭歸蹉跌，曹丕稱帝。凡事如是，難可逆見。臣鞠躬盡瘁，死而後已；至於成敗利鈍，非臣之明所能逆睹也。【譯文】先帝考慮到蜀漢和曹賊不能並存，帝王之業不能苟且偷安於一地，所以委任臣下去討伐曹魏。以先帝那樣的明察，估量臣下的才能，本來就知道臣下要去征討敵人，是能力微弱而敵人強大的。但是，不去討伐敵人，王業也是要敗亡的；是坐而待斃，還是主動去征伐敵人呢？因此委任臣下，一點也不猶疑。 臣下接受任命的時候，睡不安穩，食無滋味。想到要去北伐，應該先南征。所以五月裏竟渡過瀘水，深入不毛之地，兩天才能吃上一餐。臣下不是不愛惜自己，而是看到帝王之業不可能局處在蜀地而得以保全，所以冒著危險，來執行先帝的遺願，可是爭議者說這不是上策。目前敵人恰好在西面疲于對付邊縣的叛亂，東面又要竭力去應付孫吳的進攻，兵法要求趁敵方勞困時發動進攻，當前正是趕快進軍的時機啊！現在謹將這些事陳述如下：高祖皇帝的明智，可以和日月相比，他的謀臣見識廣博，謀略深遠，但還是要經歷艱險，身受創傷，遭遇危難然後才得安定。現在，陛下及不上高祖皇帝，謀臣也不如張良、陳平，而想用長期相持的戰略來取勝，安安穩穩地平定天下，這是臣下所不能理解的第一點。劉繇、王朗，各自佔據州郡；在議論安守策略時，動輒引用古代聖賢的話，大家疑慮滿腹，胸中充斥著懼難；今年不出戰，明年不征討，讓孫策安然強大起來，終於併吞了江東，這是臣下所不能理解的第二點。曹操的智慧謀略，遠遠超過別人，他用兵好象孫武、吳起那樣，但是在南陽受到窘困，在烏巢遇上危險，在祁山遭到厄難，在黎陽被敵困逼，幾乎慘敗在北山，差一點死在潼關，然後才得僭稱國號於一時。何況臣下才能低下，而竟想不冒艱險來平定天下，這是臣下所不能理解的第三點。曹操五次攻打昌霸而攻不下；四次想跨越巢湖而未成功，任用李服，而李服密謀對付他；委用夏侯淵，而夏侯淵卻敗死了。先帝常常稱讚曹操有能耐，可還是有這些挫敗，何況臣下才能低劣，怎麼能保證一定得勝呢？這是臣下所不能理解的第四點。自從臣下進駐漢中，已一周年了，期間就喪失了趙雲、陽群、馬玉、閻芝、丁立、白壽、劉郃、鄧銅等將領及部曲將官、屯兵將官七十餘人；突將、無前、賨叟、青羌、散騎、武騎等士卒一千餘人。這些都是幾十年內從各處積集起來的精銳力量，不是一州一郡所能擁有的；再過幾年，就會損失原有兵力的三分之二，到時拿什麼去對付敵人呢？這是臣下所不能理解的第五點。現在百姓貧窮兵士疲乏，但戰爭不可能停息；戰爭不能停息，那麼待在那裏等待敵人來進攻，和出去攻擊敵人，其勞力費用正是相等的。不趁此時去出擊敵人，卻想拿益州一地來和敵人長久對峙，這是臣下所不能理解的第六點。最難於判斷的，是戰事。當初先帝兵敗於楚地，這時候曹操拍手稱快，以為天下已經平定了。但是，後來先帝在東面與孫吳連和，西面取得了巴蜀之地，出兵北伐，夏侯淵掉了腦袋，這是曹操估計錯誤。看來復興漢室的大業快要成功了。但是，後來孫吳又違背盟約，關羽戰敗被殺，先帝又在秭歸遭到挫敗，而曹丕就此稱帝。所有的事都是這樣，很難加以預料。臣下只有竭盡全力，直到自己死去為止。至於伐魏興漢究竟是成功還是失敗，是順利還是困難，那就不是臣下的智力所能預見的了。"
    
    @IBOutlet weak var gameChatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定 navigationBar 是否為透明，會關係到元件座標，true 則從(0.0)開始，false 則從 (0,navigationBar.frame.maxY)開始
        self.navigationController?.navigationBar.isTranslucent = false
        
        // Navigatin Bar 一些元件建立
        self.title = viewControllerTitle
        let image = UIImage(named: "question.png")
        let barBtnImage = image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let gameRuleBarBtn = UIBarButtonItem(image: barBtnImage,
                                              style: UIBarButtonItemStyle.plain,
                                              target: self,
                                              action: #selector(gameRuleBarBtnAction(sender:)))
        let openNewRoomBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add,
                                                target: self,
                                                action:  #selector(openNewRoomBarBtnAction(sender:)))
        let rightBarBtns : [UIBarButtonItem] = [gameRuleBarBtn,openNewRoomBarBtn]
        self.navigationItem.rightBarButtonItems = rightBarBtns
    }
//MARK: -Action Function
    @objc func gameRuleBarBtnAction(sender:UIBarButtonItem){
        // 判斷遊戲規則頁面是否有顯示
        if gameRuleViewShowing {
            return
        }
        // 遊戲規則設定有顯示
        gameRuleViewShowing = true
        // 新增一個覆蓋住原本畫面，顏色為淺灰色的View(gameRuleCoverViewFrame)
        let origoViewFrame = self.view.frame
        let gameRuleCoverViewFrame = CGRect(x: 0,
                                             y: 0 ,
                                             width: origoViewFrame.width,
                                             height: origoViewFrame.height)
        gameRuleCoverView = UIView(frame: gameRuleCoverViewFrame)
        gameRuleCoverView.backgroundColor = UIColor(red: 102/255,
                                                     green: 102/255,
                                                     blue: 102/255,
                                                     alpha: 0.5)
        self.view.addSubview(gameRuleCoverView)
        
        // 在覆蓋住的 View 上放入 遊戲說明View(gameRuleView)
        let gameRuleViewFrame = CGRect(x:self.gameRuleCoverView.frame.midX - self.gameRuleCoverView.frame.width*0.4,
                                        y:20,
                                        width: self.gameRuleCoverView.frame.width*0.8,
                                        height: self.gameRuleCoverView.frame.height*0.8)
        let gameRuleView = UIView(frame: gameRuleViewFrame)
        gameRuleView.backgroundColor = UIColor.red
        self.gameRuleCoverView.addSubview(gameRuleView)
        
        // 放入顯示說明的textView
        let gameRuleTextViewFrame = CGRect(x: 0,
                                           y: 0,
                                           width: gameRuleViewFrame.width,
                                           height: gameRuleViewFrame.height*0.9)
        let gameRuleTextView = UITextView(frame: gameRuleTextViewFrame)
        gameRuleTextView.isEditable = false
        gameRuleTextView.text = gameRuleText
        gameRuleView.addSubview(gameRuleTextView)
        // 建立確定按鈕
        let gameRuleCancelBtnFrame = CGRect(x: gameRuleTextViewFrame.minX,
                                            y: gameRuleTextViewFrame.maxY,
                                            width: gameRuleViewFrame.width,
                                            height: gameRuleViewFrame.height*0.1)
        let gameRuleCancelBtn = UIButton(frame: gameRuleCancelBtnFrame)
        gameRuleCancelBtn.setTitle("確定", for: UIControlState.normal)
        gameRuleCancelBtn.addTarget(self, action: #selector(closeGameRuleBtnAction(sender:)), for: UIControlEvents.touchUpInside)
        gameRuleCancelBtn.layer.cornerRadius = gameRuleCancelBtnFrame.width/10
        gameRuleCancelBtn.layer.masksToBounds = true
        gameRuleCancelBtn.backgroundColor = UIColor.blue
        gameRuleView.addSubview(gameRuleCancelBtn)
    }
    @objc func openNewRoomBarBtnAction(sender:UIBarButtonItem){
        
    }
    
    @objc func closeGameRuleBtnAction(sender:UIButton){
        gameRuleViewShowing = false
        self.gameRuleCoverView.removeFromSuperview()
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        gameRuleViewShowing = false
        self.gameRuleCoverView.removeFromSuperview()
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
extension GameChatRoomViewController:UITableViewDelegate,UITableViewDataSource{
    // 設定TableView 有多個大分類的名字
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    // 回傳大分類的總數
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    // 回傳Cell 的總數（即各個大分類中成員的數量）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
            cell = tableView.dequeueReusableCell(withIdentifier: "publicChatCell", for: indexPath)
            cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select:\(self.items[indexPath.section][indexPath.row])")
        guard let groupChatRoomVC = storyboard?.instantiateViewController(withIdentifier: "JSQChatViewController") as? JSQChatViewController else{
            return
        }
        groupChatRoomVC.groupRoomBool = true
        groupChatRoomVC.title = "\(self.items[indexPath.section][indexPath.row])"
        // 隱藏tapBar
        groupChatRoomVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(groupChatRoomVC, animated: true)
    }
    
}
