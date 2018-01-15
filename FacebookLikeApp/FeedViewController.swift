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
        return CGSize(width: view.frame.width, height: 60)
    }
}


class FeedCell:  UICollectionViewCell{
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedText = NSMutableAttributedString(string: "Jayanta Gogoi", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "\nJanuary 10 . Mumbai .", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.init(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)]))
        
            let parahraphStyle = NSMutableParagraphStyle()
            parahraphStyle.lineSpacing = 4
        
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: parahraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
            let attachment = NSTextAttachment()
            attachment.image = #imageLiteral(resourceName: "globe_icon")
            attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
            attributedText.append(NSAttributedString(attachment: attachment))
        
            label.attributedText = attributedText
        
                 
        return label
    }()
    
    let profileImageView : UIImageView = {
    
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "jay")
        imageView.contentMode = .scaleAspectFit

        return imageView
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     }
    
    func setupView(){
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-8-[v0(44)]-8-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView,"v1": nameLabel]))
        
        addConstrainsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstrainsWithFormat(format: "V:|-8-[v0(44)]", views: profileImageView)
    }
    
}

extension UIView{

    func addConstrainsWithFormat(format: String, views: UIView...){
    
        var viewsDictionary = [String:UIView]()
        
        for (index, view) in views.enumerated(){
        
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}



/*
 addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-8-[v0(44)]-8-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView,"v1": nameLabel]))
 
 addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
 
 addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(44)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView]))
 */



