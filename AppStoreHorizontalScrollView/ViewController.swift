//
//  ViewController.swift
//  AppStoreHorizontalScrollView
//
//  Created by steve on 15/01/2019.
//  Copyright © 2019 BrainTools. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var dataSource: DataSource!
    private var delegate: Delegate!
    
    private let numbers = [1, 2, 3, 4, 5, 6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = DataSource(collectionView: collectionView, numbers: numbers)
        delegate = Delegate(collectionView: collectionView, numbers: numbers)
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        
    }


}

