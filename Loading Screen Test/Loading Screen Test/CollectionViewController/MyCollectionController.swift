//
//  MyCollectionController.swift
//  Loading Screen Test
//
//  Created by admin on 3/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MyCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reuseIndentifier = "asdf"
    let anotherReuseIndentifier = "swedsweds"
    
    @objc func handleRefresh(_ sender: UIButton){
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        view.backgroundColor = UIColor.yellow
        collectionView.register(MyCollectionCell.self, forCellWithReuseIdentifier: reuseIndentifier)
        collectionView.register(AnotherCollectionCell.self, forCellWithReuseIdentifier: anotherReuseIndentifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(handleRefresh(_:)))
    }
    
    //MARK:- CollectionView Functions
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 99
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: indexPath) as! MyCollectionCell
        return cell
    }
}
