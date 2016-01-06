//
//  ViewController.swift
//  连带动画UISanpBehavior-Swift
//
//  Created by 赵鑫 on 16/1/6.
//  Copyright © 2016年 赵鑫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var squareView:UIView!
    var animator:UIDynamicAnimator!
    var snapBehavior:UISnapBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createSmallSquareView()
        self.createAnimatorAndBehaviors()
        self.createGestureRecognizer()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //1.初始化基本控件
    func createSmallSquareView() {
    
        self.squareView = UIView()
        self.squareView.frame = CGRectMake(100, 100, 80, 80)
        self.squareView.backgroundColor = UIColor.greenColor()
        self.squareView.center = self.view.center
        self.view.addSubview(self.squareView)
        
        
    }
    
    func createAnimatorAndBehaviors(){
    
        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.snapBehavior = UISnapBehavior(item: self.squareView, snapToPoint: self.squareView.center)
        self.snapBehavior.damping = 0.5
        self.animator.addBehavior(self.snapBehavior)
        
    }
    
    //2.添加手势给控制器view
    func createGestureRecognizer() {
    
        let tap = UITapGestureRecognizer(target: self, action: "snapTap:")
        self.view.addGestureRecognizer(tap)
    }

    //3.执行手势监听方法
    
    func snapTap(paramTap: UITapGestureRecognizer) {
    
        let tapPoint = paramTap.locationInView(self.view)
        if self.snapBehavior != nil {
        
            self.animator.removeBehavior(self.snapBehavior)
        }
        self.snapBehavior = UISnapBehavior(item: self.squareView, snapToPoint: tapPoint)
        self.snapBehavior.damping = 0.5
        self.animator.addBehavior(self.snapBehavior)
        
    }

}

