//
//  Delegate.swift
//  KakaoMobility
//
//  Created by steve on 31/12/2018.
//  Copyright © 2018 Mobility-iOS. All rights reserved.
//

import UIKit

class Delegate: NSObject, UICollectionViewDelegate, UIScrollViewDelegate {
    
    private weak var collectionView: UICollectionView!
    private var numbers: [Int]
    
    private var collectionViewFlowLayout: UICollectionViewFlowLayout {
        return collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    }
    private var cellIndex = 0
    private var minimumLineSpacing: CGFloat = 10.0
    private var leftRightMargin: CGFloat = 20
    private var velocityThreshold: CGFloat = 0.33
    
    init(collectionView: UICollectionView, numbers: [Int]) {
        self.collectionView = collectionView
        self.numbers = numbers
        super.init()
        let cellWidth = UIScreen.main.bounds.size.width - (leftRightMargin * 2)
        
        collectionViewFlowLayout.itemSize = CGSize(width: cellWidth, height: collectionView.bounds.height)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: leftRightMargin, bottom: 0, right: leftRightMargin)
        collectionViewFlowLayout.minimumLineSpacing = minimumLineSpacing
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if collectionView.visibleCells.count == 2 {
            let containsZero = collectionView.visibleCells.contains {
                if let row = collectionView.indexPath(for: $0)?.row {
                    return row == 0
                } else {
                    return false
                }
            }
            if containsZero {
                cellIndex = 0
            }
            
            let containsLastIndex = collectionView.visibleCells.contains {
                if let row = collectionView.indexPath(for: $0)?.row {
                    return row == numbers.count - 1
                } else {
                    return false
                }
            }
            if containsLastIndex {
                cellIndex = numbers.count - 1
            }
        } else if collectionView.visibleCells.count == 3 {
            let rows = collectionView.visibleCells.map {
                collectionView.indexPath(for: $0)!.row
            }
            cellIndex = rows.min()! + 1
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellAndMinimumSpacingWidth = collectionViewFlowLayout.itemSize.width + collectionViewFlowLayout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let roughFloatIndex = (offset.x + scrollView.contentInset.left) / cellAndMinimumSpacingWidth
        var estimatedCellIndex = round(roughFloatIndex)
        
        if cellIndex == Int(estimatedCellIndex) {
            if velocity.x > velocityThreshold {
                estimatedCellIndex = Int(estimatedCellIndex) < numbers.count - 1 ? estimatedCellIndex + 1 : estimatedCellIndex
            } else if velocity.x < -velocityThreshold {
                estimatedCellIndex = Int(estimatedCellIndex) > 0 ? estimatedCellIndex - 1 : estimatedCellIndex
            }
        }
        
        offset = CGPoint(x: estimatedCellIndex * cellAndMinimumSpacingWidth - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
