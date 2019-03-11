//
//  ViewController.swift
//  Loading Screen Test
//
//  Created by admin on 3/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FirstController: UIViewController {
    
    let blueBackGround: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let myActivityIndicatorView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        activityView.style = .whiteLarge
        activityView.startAnimating()
        return activityView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(handleButton))
        
        
        
        [blueBackGround].forEach{view.addSubview($0)}
        myActivityIndicatorView.center = view.center
        NSLayoutConstraint.activate([
            blueBackGround.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            blueBackGround.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            blueBackGround.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            blueBackGround.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            ])
    }
    
    
    
    @objc func handleButton(){
        let newController = MyCollectionController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(newController, animated: true)
    }
    

}

