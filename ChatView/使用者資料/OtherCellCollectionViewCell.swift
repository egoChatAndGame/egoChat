//
//  OtherCellCollectionViewCell.swift
//  ChatView
//
//  Created by Uran on 2017/11/13.
//  Copyright © 2017年 Uran. All rights reserved.
//

import UIKit

class OtherCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var otherCellImageView: UIImageView!
    @IBOutlet weak var otherItemLabel: UILabel!
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        otherCellImageView.layer.cornerRadius = otherCellImageView.frame.width/2
        otherCellImageView.layer.masksToBounds = true
        otherCellImageView.backgroundColor = UIColor.red
        // 把 OtherCellCollectionViewCell 設為圓形
//        self.layer.cornerRadius = self.frame.width/2
//        self.layer.masksToBounds = true
    }
}
