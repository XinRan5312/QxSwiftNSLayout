//
//  ViewController.swift
//  QxSwiftTestNSLayout
//
//  Created by 新然 on 17/3/9.
//  Copyright © 2017年 com.wrqx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var img=UILabel()
    var lable=UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(img)
        self.view.addSubview(lable)
//        img.text="我是img"
//        lable.text="我是Lable"
//        img.textColor=UIColor.redColor()
//        lable.textColor=UIColor.blueColor()
        // Do any additional setup after loading the view, typically from a nib.
        self.testNSLayoutContraint()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func  testNSLayoutContraint(){
        //下面两句话的意思是遵循NSLayoutConstraint约束，抛弃原有的设置，没有这两句设置NSLayoutContraint不起作用
        img.translatesAutoresizingMaskIntoConstraints=false
        lable.translatesAutoresizingMaskIntoConstraints=false

        img.text="我是img"
        lable.text="我是Lable"
        img.textColor=UIColor.redColor()
        lable.textColor=UIColor.blueColor()
        let imgWith=NSLayoutConstraint(item: self.img, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100)
        let lableWith=NSLayoutConstraint(item: self.lable, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.img, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        let imgHeiht=NSLayoutConstraint(item: self.img, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 50)
        let lableHeight=NSLayoutConstraint(item: self.lable, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.img, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        let lableleft=NSLayoutConstraint(item: self.lable, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 50)
        let imgLeft=NSLayoutConstraint(item: self.img, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.lable, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 20)
        let lableY=NSLayoutConstraint(item: self.lable, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 100)
        let imgY=NSLayoutConstraint(item: self.img, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.lable, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)

        //这样就形成了：
        //1:lable的左边距离父布局50 top距离父布局100，宽是100高是50的约束
        //2：img的左边距lable的右边20，bottom跟lable一样，宽高也一样的约束
        
        self.view.addConstraints([imgWith,lableWith,lableleft,lableY,imgLeft,imgY,lableHeight,imgHeiht])
    }

}

