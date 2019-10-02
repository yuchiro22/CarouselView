//
//  MenuCarouselView.swift
//  ErecipeTopPage
//
//  Created by 辻 悠一郎 on 2019/10/02.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import UIKit

class MenuCarouselView: UICollectionView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let cellIdentifier = "menuCarousel"
    let pageCount = 5
    var cellItemsWidth: CGFloat = 0.0
    let colors: [UIColor] = [.blue, .yellow, .orange, .red, .gray]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        self.register(MenuCarouselCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    convenience init(frame: CGRect) {
        let layout = PagingPerCellFlowLayout()
        layout.itemSize = CGSize(width: 200, height: frame.height/2)
        layout.scrollDirection = .horizontal
        
        self.init(frame: frame, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.backgroundColor = UIColor.white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let cells = self.visibleCells
        for cell in cells {
            transformScale(cell: cell)
        }
    }
    
    // メイン以外のcellを縮小する
    func transformScale(cell: UICollectionViewCell) {
        let cellCenterX: CGFloat = self.convert(cell.center, to: nil).x
        let screenCenterX: CGFloat = UIScreen.main.bounds.width/2
        let reductionRatio: CGFloat = -0.0009
        let maxScale: CGFloat = 1
        let cellToScreenCenterDisX: CGFloat = abs(screenCenterX - cellCenterX)
        let newScale = reductionRatio * cellToScreenCenterDisX + maxScale
        cell.transform = CGAffineTransform(scaleX: newScale, y: newScale)
    }
    
    func scrollToFirstItem() {
        self.layoutIfNeeded()
        self.scrollToItem(at: IndexPath(row: self.pageCount, section: 0), at: .centeredHorizontally, animated: false)
    }
}

extension MenuCarouselView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if cellItemsWidth == 0.0 {
            cellItemsWidth = floor(scrollView.contentSize.width / 3.0)
        }
        
        if (scrollView.contentOffset.x <= 0.0 || (scrollView.contentOffset.x > cellItemsWidth*2.0)) {
            scrollView.contentOffset.x = cellItemsWidth
        }
    }
}

extension MenuCarouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pageCount*3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        configureCell(cell: cell as! MenuCarouselCell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: MenuCarouselCell, indexPath: IndexPath) {
        let fixedIndex = indexPath.row%pageCount
        
        cell.contentView.layer.borderColor = colors[fixedIndex].cgColor
    }
    
}
