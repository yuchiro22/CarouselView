//
//  MenuCarouselCell.swift
//  ErecipeTopPage
//
//  Created by 辻 悠一郎 on 2019/10/02.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

class MenuCarouselCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    func setup() {
        self.contentView.backgroundColor = UIColor.white
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.contentView.layer.shadowOpacity = 1
        self.contentView.layer.shadowRadius = 10
    }
}
