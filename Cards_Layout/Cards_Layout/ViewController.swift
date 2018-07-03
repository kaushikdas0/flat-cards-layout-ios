//
//  ViewController.swift
//  Cards_Layout
//
//  Created by kdas on 11/2/16.
//  Copyright © 2016 Classic Tutorials. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var cards: UICollectionView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CardsCell", forIndexPath: indexPath)
        
        return cell
        
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
        
        let pageWidth:Float = Float(self.view.frame.size.width - 40.0 + 10.0) // Your cell Width + Min Spacing for Lines

        let currentOffSet:Float = Float(scrollView.contentOffset.x)
        print(currentOffSet)
        let targetOffSet:Float = Float(targetContentOffset.pointee.x)

        print(targetOffSet)
        var newTargetOffset:Float = 0

        if(targetOffSet > currentOffSet) {
            newTargetOffset = ((currentOffSet / pageWidth).rounded(.up) * (pageWidth))
            print(ceilf(currentOffSet / pageWidth))
        } else if(targetOffSet < currentOffSet) {
            newTargetOffset = ((currentOffSet / pageWidth).rounded(.down) * (pageWidth))
            print(floorf(currentOffSet / pageWidth))
        } else {
            newTargetOffset = ((currentOffSet / pageWidth).rounded(.toNearestOrAwayFromZero) * (pageWidth))
        }

        if(newTargetOffset < 0) {
            newTargetOffset = 0;
        } else if (newTargetOffset > Float(scrollView.contentSize.width)) {
            newTargetOffset = Float(scrollView.contentSize.width)
        }

        targetContentOffset.pointee.x = CGFloat(currentOffSet)
        scrollView.setContentOffset(CGPoint(x: Int(newTargetOffset), y: 0), animated: true)
    }

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

