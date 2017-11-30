//
//  GameCollectionViewCell.swift
//  ChatView
//
//  Created by Uran on 2017/11/15.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // 把 gameImageView 設為圓形
        gameImageView.backgroundColor = UIColor.red
        gameImageView.layer.cornerRadius = self.gameImageView.frame.width/2
        gameImageView.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
    }
}
