//
//  ViewController.swift
//  CodeAutoLayoutBySwift
//
//  Created by liyan on 12/24/14.
//  Copyright (c) 2014 Plaza66. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView = UIScrollView()
        self.scrollView.backgroundColor = UIColor.redColor()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(self.scrollView)
        
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[_scrollView]|", options:NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: ["_scrollView": self.scrollView] )
        self.view.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[_scrollView]|", options:NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: ["_scrollView": self.scrollView] )
        self.view.addConstraints(constraints)
        
        let contextView = UIView()
        
        contextView.translatesAutoresizingMaskIntoConstraints = false
        contextView.backgroundColor = UIColor.grayColor()
        self.scrollView.addSubview(contextView)
        
        self.scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contextView]|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: ["contextView":contextView]))
        
        self.scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[contextView]|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: ["contextView":contextView]))
        
        self.scrollView.addConstraint(NSLayoutConstraint(item: contextView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.scrollView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        
        var temp :UIView?
        
        var height:CGFloat = 10.0;
        
        for _ in 0...49
        {
            let view = UIView()
            view.backgroundColor = self.randomColor()
            view.translatesAutoresizingMaskIntoConstraints = false
            contextView.addSubview(view)
            let attribute :NSLayoutAttribute = (temp != nil) ? NSLayoutAttribute.Bottom : NSLayoutAttribute.Top
            contextView.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: ((temp != nil) ? temp : contextView), attribute:attribute, multiplier: 1, constant: 0))
            
            contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: ["view":view]))
            
            contextView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view(==height)]", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: ["height":height], views: ["view":view]))
            temp = view;
            height = height * 1.1
            
        }
        
        self.scrollView.addConstraint(NSLayoutConstraint(item: contextView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: temp, attribute:NSLayoutAttribute.Bottom, multiplier: 1, constant: 0))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func randomColor()->UIColor
    {
        let hue:CGFloat         = CGFloat( arc4random() % 256 ) / 256.0
        let saturation:CGFloat  = CGFloat( arc4random() % 128 ) / 256.0 + 0.5
        let brightness:CGFloat  = CGFloat( arc4random() % 128 ) / 256.0 + 0.5
        
        return UIColor(hue:hue, saturation:saturation, brightness:brightness, alpha:1.0)
        
    }
    
    
}

