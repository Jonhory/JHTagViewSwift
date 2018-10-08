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
    
    let changeBtn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        loadTagView()
        loadBtn()
    }
    
    @objc func toChange() {
        tagModels.removeAll()
        loadData()
        tagView?.removeFromSuperview()
        loadTagView()
    }
    
    func loadBtn() {
        let f = CGRect(x: 0, y: SCREEN.height - 49, width: SCREEN.width, height: 49)
        changeBtn.frame = f
        changeBtn.setTitle("改变一下", for: .normal)
        changeBtn.backgroundColor = .black
        changeBtn.addTarget(self, action: #selector(toChange), for: .touchUpInside)
        view.addSubview(changeBtn)
    }
    
    func loadData() {
        for _ in 0...arc4random()%30 {
            let m = JHTagModel()
            var length = Int(arc4random()) % 10
            length = length > 0 ? length : 1
            m.text = getRandomStringOfLength(length: length)
            m.font = UIFont.systemFont(ofSize: 12)
            // 如果需要等宽的标签，只需要设置width属性即可
            m.width = 70
            m.widthMargin = 10
            m.heightMargin = 10
            m.config(cornerRadius: 5, borderWidth: 1, normalBorderColor: .gray, normalTitleColor: .gray, normalBackgroundColor: .white, selectTitleColor: .orange, selectBackgroundColor: .white, selectBorderColor: .orange)
            m.isAbleToSelect = true
            tagModels.append(m)
        }
    }
    
    func loadTagView() {
        let f = CGRect(x: 0, y: 0, width: SCREEN.width - 100, height: 0)
        tagView = JHTagView(frame: f)
        
        tagView?.backgroundColor = .green
        tagView?.config(maxWidth: SCREEN.width - 100, horizontalMargin: 10, verticalMargin: 10)
        
        // 1.计算高度
        let height = tagView?.getMaxHeightWith(models: tagModels)
        // 2.赋值
        tagView?.tagModels = tagModels
        // 3. 重置高度
        tagView?.frame = CGRect(x: 0, y: 0, width: SCREEN.width - 100, height: height!)
        tagView?.delegate = self
        
        tagView?.center = view.center
        view.addSubview(tagView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("当前共选中 \(tagView!.getSelectedModels().count) 个数据")
    }

}

extension ViewController: JHTagViewDelegate {
    func jh_tagViewClicked(model: JHTagModel, isSelected: Bool) {
        print("点击了\(model.text!), 当前是否选中:\(isSelected)")
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

/**
 生成随机字符串,
 
 - parameter length: 生成的字符串的长度
 
 - returns: 随机生成的字符串
 */
func getRandomStringOfLength(length: Int) -> String {
    var ranStr = ""
    let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    for _ in 0..<length {
        let index = Int(arc4random_uniform(UInt32(characters.characters.count)))
        ranStr.append(characters[characters.index(characters.startIndex, offsetBy: index)])
    }
    return ranStr
}
