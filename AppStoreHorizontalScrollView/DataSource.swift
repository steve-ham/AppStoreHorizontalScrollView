//
//  DataSource.swift
//  KakaoMobility
//
//  Created by steve on 31/12/2018.
//  Copyright © 2018 Mobility-iOS. All rights reserved.
//

import UIKit

class DataSource: NSObject, UICollectionViewDataSource {
    
    private let collectionView: UICollectionView
    private let numbers: [Int]
    
    init(collectionView: UICollectionView, numbers: [Int]) {
        self.collectionView = collectionView
        self.numbers = numbers
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        switch indexPath.row {
        case 0:
            cell.backgroundColor = .red
        case 1:
            cell.backgroundColor = .orange
        case 2:
            cell.backgroundColor = .yellow
        case 3:
            cell.backgroundColor = .green
        case 4:
            cell.backgroundColor = .blue
        case 5:
            cell.backgroundColor = .purple
        default:
            cell.backgroundColor = .white
        }
        
        return cell
    }
}
