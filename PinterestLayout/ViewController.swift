//
//  ViewController.swift
//  PinterestLayout
//
//  Created by Vương Toàn Bắc on 8/31/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
  
    var collectionViewFloLayout:UICollectionViewFlowLayout!
    let privateIdentifier = "CollectionViewCell"
     let model = Model()


    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
         collectionView.register(UINib(nibName: privateIdentifier, bundle:nil), forCellWithReuseIdentifier: privateIdentifier)
        model.buildDataSource()
        
        //Layout setup
        setupCollectionView()
        
        //Register nibs
        registerNibs()
    }
    
    func setupCollectionView(){
        
        // Create a waterfall layout
        let layout = CHTCollectionViewWaterfallLayout()
        
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        
        // Collection view attributes
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.alwaysBounceVertical = true
        
        // Add the waterfall layout to your collection view
        collectionView.collectionViewLayout = layout
    }
    
    func registerNibs(){
        
        // attach the UI nib file for the ImageUICollectionViewCell to the collectionview
        let viewNib = UINib(nibName: "ImageUICollectionViewCell", bundle: nil)
        collectionView.register(viewNib, forCellWithReuseIdentifier: "cell")
    }
    
    
}


extension ViewController :UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let imageSize = model.images[indexPath.row].size
         return imageSize
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.images.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: privateIdentifier, for: indexPath) as! CollectionViewCell
        cell.image.image = model.images[indexPath.row]
        return cell
    }
    
    
}



