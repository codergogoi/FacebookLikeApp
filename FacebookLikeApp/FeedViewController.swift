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
        return CGSize(width: view.frame.width, height: 360)
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
    
    let feedTextView : UITextView = {
        
        let txtView = UITextView()
        txtView.text = "This is one of my application which is released for online mock test!"
        txtView.textColor = UIColor.darkGray
        txtView.translatesAutoresizingMaskIntoConstraints = false
        txtView.showsVerticalScrollIndicator = false
        return txtView
    }()
    
    let feedImg : UIImageView = {
    
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = #imageLiteral(resourceName: "tns1")
        img.clipsToBounds = true
        return img
    }()
    
    let likeAndCommentCount : UILabel = {
    
        let label = UILabel()
        
        label.textColor = UIColor.init(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "345 Likes  27.3K Comments"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lineView: UIView = {
    
        let lineView = UIView()
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor.init(red: 155/255, green: 161/255, blue: 171/255, alpha: 1)
        return lineView
        
    }()
    
    let buttonNestedView : UIView = {
    
        let actionView = UIView()
        actionView.translatesAutoresizingMaskIntoConstraints = false
        return actionView
    }()
    
    let likeButton : UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
       
        let attrString = NSMutableAttributedString()
        
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "like_icon")
        attachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        
        let attrIcon = NSAttributedString(attachment:attachment)
        
        attrString.append(attrIcon)
        
        let attrTitle = NSAttributedString(string: " Like", attributes:[NSForegroundColorAttributeName: UIColor.darkGray, NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12)])
        
        attrString.append(attrTitle)
        
        btn.setAttributedTitle(attrString, for: .normal)
        
        return btn
    }()

    let commentButton : UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
     
        let attrString = NSMutableAttributedString()
        
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "comment_icon")
        attachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        
        let attrIcon = NSAttributedString(attachment:attachment)
        
        attrString.append(attrIcon)
        
        let attrTitle = NSAttributedString(string: " Comment", attributes:[NSForegroundColorAttributeName: UIColor.darkGray, NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12)])
        
        attrString.append(attrTitle)
        
        btn.setAttributedTitle(attrString, for: .normal)
        
        
        return btn
    }()

    let shareButton : UIButton = {
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        let attrString = NSMutableAttributedString()
        
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "share_icon")
        attachment.bounds = CGRect(x: 0, y: 0, width: 16, height: 16)
        
        let attrIcon = NSAttributedString(attachment:attachment)
        
        attrString.append(attrIcon)
        
        let attrTitle = NSAttributedString(string: " Share", attributes:[NSForegroundColorAttributeName: UIColor.darkGray, NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12)])
        
        attrString.append(attrTitle)
        
        btn.setAttributedTitle(attrString, for: .normal)
        
        return btn
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
        addSubview(feedTextView)
        addSubview(feedImg)
        addSubview(likeAndCommentCount)
        addSubview(lineView)
        addSubview(buttonNestedView)
        
        buttonNestedView.addSubview(likeButton)
        buttonNestedView.addSubview(commentButton)
        buttonNestedView.addSubview(shareButton)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-8-[v0(44)]-8-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": profileImageView,"v1": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": feedTextView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": feedImg]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": likeAndCommentCount]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": lineView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": buttonNestedView]))
        
        addConstrainsWithFormat(format: "V:|-14-[v0]", views: nameLabel)
        addConstrainsWithFormat(format: "V:|-14-[v0(44)]-[v1(40)]-[v2(170)]-[v3]-[v4(0.5)][v5(40)]|", views: profileImageView,feedTextView,feedImg,likeAndCommentCount,lineView, buttonNestedView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(v2)][v1(v2)][v2]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": likeButton, "v1": commentButton, "v2": shareButton]))
        
        addConstrainsWithFormat(format: "V:|[v0]|", views: likeButton)
        addConstrainsWithFormat(format: "V:|[v0]|", views: commentButton)
        addConstrainsWithFormat(format: "V:|[v0]|", views: shareButton)
        
        
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






