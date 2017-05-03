//
//  ViewController.swift
//  TagViewDemoForSwift
//
//  Created by Jonhory on 2017/5/3.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tagModels: [JHTagModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

