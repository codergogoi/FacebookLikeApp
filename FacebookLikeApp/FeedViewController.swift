//
//  ViewController.swift
//  FacebookLikeApp
//
//  Created by Jayanta Gogoi on 1/14/18.
//  Copyright © 2018 Jayanta Gogoi. All rights reserved.
//

import UIKit

let identifier = "cell"

class FeedViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Facebook Feed"
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: identifier)
        
        print("working...")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
         return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    
}

extension FeedViewController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}


class FeedCell:  UICollectionViewCell{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     }
    
    func setupView(){
        backgroundColor = UIColor.white
    }
    
}



