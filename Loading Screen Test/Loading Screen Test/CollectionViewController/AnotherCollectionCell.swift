//
//  MyCollectionCell.swift
//  Loading Screen Test
//
//  Created by admin on 3/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AnotherCollectionCell:UICollectionViewCell{
    
    
    
    let blueRoundedSquare: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let myActivityIndicatorView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView()
        activityView.style = .whiteLarge
        activityView.hidesWhenStopped = false
        activityView.startAnimating()
        activityView.translatesAutoresizingMaskIntoConstraints = false
        return activityView
    }()
    
    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(greenView)
        greenView.insertSubview(myActivityIndicatorView, at: 0)
        greenView.insertSubview(blueRoundedSquare, at: 0)
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: topAnchor),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myActivityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            myActivityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            blueRoundedSquare.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            blueRoundedSquare.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            blueRoundedSquare.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            blueRoundedSquare.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -3),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        //        if let temp = self.myActivityIndicatorView {
        //
        //        }
        
        self.myActivityIndicatorView.startAnimating()
    }
}
