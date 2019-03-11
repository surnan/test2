//
//  AnotherVC.swift
//  Loading Screen Test
//
//  Created by admin on 3/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import MapKit

class FirstCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let reuseIndentifier = "asdf"

    let layout: UICollectionViewFlowLayout = {
        let temp = UICollectionViewFlowLayout()
        temp.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        temp.itemSize = .init(width: 100, height:   100)
        temp.scrollDirection = .vertical
        temp.minimumLineSpacing = 20
        return temp
    }()
    
    lazy var myCollectionView: UICollectionView = {
        var myCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIndentifier)
        myCollectionView.showsVerticalScrollIndicator = false
        myCollectionView.backgroundColor = UIColor.black
        myCollectionView.allowsMultipleSelection = true
        return myCollectionView
    }()
    
    lazy var myButton: UIButton = {
       let button = UIButton()
        button.setTitle("New Collection", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        
        button.setTitle("Remove Selected Pictures", for: .selected)
        button.setTitleColor(UIColor.red, for: .selected)
        
        button.addTarget(self, action: #selector(handleMyButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //Should this be "SET" ?
    var indexPathArrayToDelete = [IndexPath](){
        didSet {
            indexPathArrayToDelete.forEach{print("Current Entry --> \($0)")}
            
            if indexPathArrayToDelete.count == 0 {
                myButton.isSelected = false
            } else {
                myButton.isSelected = true
            }
        }
    }
    
    var myMapView: MKMapView = {
       let map = MKMapView()
        map.isScrollEnabled = true
        map.isZoomEnabled = true
        map.mapType = .standard
        map.showsCompass = true //not working on simulator
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    
    @objc func handleMyButton(_ sender: UIButton){
        print("Hello World")
        sender.isSelected = !sender.isSelected
    }
    
    
    //MARK:-CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIndentifier, for: indexPath)
        if indexPathArrayToDelete.contains(indexPath){
            cell.backgroundColor = UIColor.green
        } else {
            cell.backgroundColor = UIColor.yellow
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected cell at: \(indexPath)")
        indexPathArrayToDelete.append(indexPath)
        let tempCell = myCollectionView.cellForItem(at: indexPath)
        tempCell?.backgroundColor = UIColor.green
    }
    

    //MARK:- overloads  ui
    override func viewDidLoad() {
        view.backgroundColor = UIColor.blue
        setupNavigationMenu()
        setupMapView()
        [myMapView, myCollectionView, myButton].forEach{ view.addSubview($0) }
        setupCollectionView()
    }
    
    func setupNavigationMenu(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Re-Center", style: .done, target: self, action: #selector(handleReCenter))
    }
    
    let firstAnnotation: MKPointAnnotation = {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 40.74504362124605, longitude: -73.98898440646418)
        return annotation
    }()
    
    @objc func handleReCenter(){
        myMapView.centerCoordinate = firstAnnotation.coordinate
    }
    
    func setupMapView() {
        myMapView.addAnnotation(firstAnnotation)
        myMapView.centerCoordinate = firstAnnotation.coordinate
        //Setting up Zoom
        let noLocation = firstAnnotation.coordinate
        let viewRegion = MKCoordinateRegion(center: noLocation, latitudinalMeters: 200, longitudinalMeters: 200)
        myMapView.setRegion(viewRegion, animated: false)
    }
    
    func setupCollectionView(){
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myMapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myMapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            myMapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            myMapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
            
            myButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            myButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 30),
            
            myCollectionView.topAnchor.constraint(equalTo: myMapView.bottomAnchor, constant: 10),
            myCollectionView.bottomAnchor.constraint(equalTo: myButton.topAnchor, constant: -10),
            myCollectionView.leadingAnchor.constraint(equalTo: myMapView.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: myMapView.trailingAnchor),
            ])
    }
}
