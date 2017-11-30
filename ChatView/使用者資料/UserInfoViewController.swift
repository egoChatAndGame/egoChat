//
//  UserInfoViewController.swift
//  ChatView
//
//  Created by Uran on 2017/11/13.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userInfoScrollView: UIScrollView!
    
    
    
    
    let spacing :CGFloat = 3
    let itemCount :CGFloat = 3
    let collectionCount = 9
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "用戶資料"
        
        userNameLabel.text = "測試者"
        userImageView.image = UIImage(named: "Unknown.jpg")
        self.navigationController?.navigationBar.isTranslucent = true
        // 下方 不設置 navigationBar 會把 scrollView 推下
        userInfoScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        // 設定讓scrollView 可以滑動，四個方位可以設定可以擴張的距離
        userInfoScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: (self.tabBarController?.tabBar.frame.width)!, right: 0)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 可用 IndexPath 來設定各個cell的尺寸
        // 取得collectionView寬度尺寸
        let collectionViewWidth = collectionView.layer.frame.width  
        let width = (collectionViewWidth-(itemCount-1)*spacing)/itemCount
        let size = CGSize(width: width, height: width)
        
        return size
    }
    // item間的距離
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    // item間line(排)的距離
    // 保證最小的距離為三，可以大於三
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "otherCell", for: indexPath)
        guard let otherCell = cell as? OtherCellCollectionViewCell else {
            return cell
        }
        otherCell.otherCellImageView.image = UIImage(named: "cake.png")
        otherCell.otherItemLabel.text = "\(indexPath.row) 個"
        
        return otherCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select \(indexPath.row)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

