//
//  AllGameViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/15.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit

class AllGameViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate {
    var leaderboardsView : UIView?

    let spacing :CGFloat = 3
    let itemCount :CGFloat = 3
    let collectionCount = 9
    let allGameVCTitle = "遊戲公告"
    
    var leaderboardTableView: UITableView = UITableView()
    let cellReuseIdentifier = "cell"
    var leaderboardMember : [String] = ["aa","bb"]
    let leaderboardChoose : [String] = ["土豪","常勝"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = allGameVCTitle
        
        // Do any additional setup after loading the view.
        
        // 設定 navigationBar 是否為透明，會關係到元件座標，true 則從(0.0)開始，false 則從 (0,navigationBar.frame.maxY)開始
        self.navigationController?.navigationBar.isTranslucent = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    @IBAction func LeaderboardsBtnAction(_ sender: Any) {
        // 設定排行榜的畫面
        leaderboardsView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        //  新增排行榜覆蓋住畫面的View
        leaderboardsView?.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
        if let leaderboardsView = leaderboardsView{
            // 把 leaderboardsView 放在 View 上
            self.view.addSubview(leaderboardsView)
            
            // 建立一個 SegmentedControl 作為選擇選項
            let leaderboardsChooseSC = UISegmentedControl(items: leaderboardChoose)
            leaderboardsChooseSC.selectedSegmentIndex = 0
            let scRect = CGRect(x: 40, y: 40, width: self.view.frame.maxX/2, height: 40)
            leaderboardsChooseSC.frame = scRect
            leaderboardsChooseSC.center = CGPoint(x: leaderboardsView.frame.midX, y: 40)
            leaderboardsChooseSC.layer.cornerRadius = 5
            leaderboardsChooseSC.backgroundColor = UIColor.blue
            leaderboardsChooseSC.tintColor = UIColor.white
            // leaderboardsChooseSC 值變換時觸發事件
            leaderboardsChooseSC.addTarget(self, action: #selector(changeLeaderBoard(sender:)), for: UIControlEvents.valueChanged)
            leaderboardsView.addSubview(leaderboardsChooseSC)
            
            // 新增 tableView 來顯示排行榜
            leaderboardTableView.frame = CGRect(x: leaderboardsView.frame.maxX/20, y: leaderboardsChooseSC.frame.maxY+1, width: leaderboardsView.frame.maxX*0.9, height: leaderboardsView.frame.maxY*0.7)
            leaderboardTableView.delegate = self
            leaderboardTableView.dataSource = self
            leaderboardTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
            leaderboardsView.addSubview(leaderboardTableView)
        }
    }
    // 排行榜的 SegmentedControl 值被觸發會進行的動作
    @objc func changeLeaderBoard(sender : UISegmentedControl){
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            leaderboardMember = ["aa","bb"]
            leaderboardTableView.reloadData()
            break
        case 1:
            leaderboardMember = ["cc","dd","ee"]
            leaderboardTableView.reloadData()
            break
        default:
            break
        }
        
    }
    // 畫面被碰到時觸發
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        leaderboardsView?.removeFromSuperview()
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
// MARK:collectionView delegate and data source Function
extension AllGameViewController{
    
    // 設定Cell 大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 160 , height: 160 )
        return size
    }
    // collectionView Cell 邊際設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    // collectionView 數量設定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCount
    }
    // collectionView cell設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath)
        guard let gameCell = cell as? GameCollectionViewCell else {
            return cell
        }
        gameCell.gameImageView.image = UIImage(named: "cake.png")
        gameCell.gameNameLabel.text = "test:\(indexPath.item)"
        
        return gameCell
    }
    // tableView cell的數量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboardMember.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = leaderboardMember[indexPath.row]
        return cell
    }
    // collectionView cell 倍先選到時的選項
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
        guard let gameChatVC = storyboard?.instantiateViewController(withIdentifier: "GameChatRoomViewController") as? GameChatRoomViewController else{
            return
        }
        gameChatVC.viewControllerTitle = "\(indexPath.row)遊戲大廳"
        self.navigationController?.pushViewController(gameChatVC, animated: true)
    }
}
