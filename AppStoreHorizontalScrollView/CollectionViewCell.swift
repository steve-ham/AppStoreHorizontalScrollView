//
//  CollectionViewCell.swift
//  KakaoMobility
//
//  Created by steve on 03/01/2019.
//  Copyright © 2019 Mobility-iOS. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "\(CollectionViewCell.self)"
    
    private var cornerRadius: CGFloat = 9.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = cornerRadius
    }
}
