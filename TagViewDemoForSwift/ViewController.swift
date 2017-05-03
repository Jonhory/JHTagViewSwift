//
//  ViewController.swift
//  TagViewDemoForSwift
//
//  Created by Jonhory on 2017/5/3.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

import UIKit

let SCREEN = UIScreen.main.bounds.size

class ViewController: UIViewController {

    var tagModels: [JHTagModel] = []
    var tagView: JHTagView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        loadTagView()
    }
    
    func loadData() {
        for i in 0...10 {
            let m = JHTagModel()
            m.text = "No.\(i)"
            m.font = UIFont.systemFont(ofSize: 12)
            print(m.width)
            tagModels.append(m)
        }
    }
    
    func loadTagView() {
        let f = CGRect(x: 0, y: 0, width: SCREEN.width - 100, height: 0)
        tagView = JHTagView(frame: f)
        tagView?.backgroundColor = UIColor.randomColor
        tagView?.config(maxWidth: SCREEN.width - 100, horizontalMargin: 10, verticalMargin: 10)
        
        // 1.计算高度
        let height = tagView?.getMaxHeightWith(models: tagModels)
        // 2.赋值
        tagView?.tagModels = tagModels
        // 3. 重置高度
        tagView?.frame = CGRect(x: 0, y: 0, width: SCREEN.width - 100, height: height!)
        
        print("高度====",height!)
        
        tagView?.center = view.center
        view.addSubview(tagView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension UIColor {
    //返回随机颜色
    open class var randomColor:UIColor{
        get{
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}
