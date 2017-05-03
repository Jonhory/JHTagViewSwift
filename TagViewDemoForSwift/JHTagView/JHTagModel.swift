//
//  JHTagModel.swift
//  TagViewDemoForSwift
//
//  Created by Jonhory on 2017/5/3.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

import Foundation
import UIKit


/// 标签样式
///
/// - normal: 默认样式
enum JHTagViewType {
    case normal
}

class JHTagModel {
    // 文字
    public var text: String?
    // 样式
    public var type: JHTagViewType = .normal
    // 是否选中
    public var isSelect: Bool = false
    // 字体
    public var font: UIFont? {
        didSet {
            size = text?.size(attributes: [NSFontAttributeName: font ?? UIFont.systemFont(ofSize: 17)])
        }
    }
    // 视图尺寸
    public var size: CGSize?
    // 视图宽度
    public var width: CGFloat {
        set { myWidth = newValue }
        get {
            if myWidth > 0 {
                return myWidth
            }
            if size == nil {
                print("请先对width赋值或者先设置font")
                return 0
            }
            return size!.width + widthMargin
        }
    }
    private var myWidth: CGFloat = 0
    
    // 视图高度
    public var height: CGFloat {
        set { myHeight = newValue }
        get {
            if myHeight > 0 {
                return myHeight
            }
            if size == nil {
                print("请先对height赋值或者先设置font")
                return 0
            }
            return size!.height + heightMargin
        }
    }
    private var myHeight: CGFloat = 0
    
    // 视图宽度增量
    public var widthMargin: CGFloat = 0
    // 视图高度增量
    public var heightMargin: CGFloat = 0
    // 是否点击后设为选中,不管该值YES or NO,代理事件都能被响应
    public var isAbleToSelect: Bool = false
    // 圆角
    public var cornerRadius: CGFloat = 0
    // 边线宽
    public var borderWidth: CGFloat {
        set { myBorderWidth = newValue }
        get { return myBorderWidth }
    }
    private var myBorderWidth: CGFloat = 0.5
    
    // 普通边框颜色
    public var normalBorderColor: UIColor = UIColor.black
    // 普通状态文字颜色
    public var normalTitleColor: UIColor = UIColor.gray
    // 普通背景颜色
    public var normalBackgroundColor: UIColor = UIColor.red
    // 选中状态文字颜色
    public var selectTitleColor: UIColor = UIColor.blue
    // 选中背景颜色
    public var selectBackgroundColor: UIColor = UIColor.purple
    
    public func config(cornerRadius: CGFloat, borderWidth: CGFloat, normalBorderColor: UIColor, normalTitleColor: UIColor, normalBackgroundColor: UIColor, selectTitleColor: UIColor, selectBackgroundColor: UIColor) {
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.normalBorderColor = normalBorderColor
        self.normalTitleColor = normalTitleColor
        self.normalBackgroundColor = normalBackgroundColor
        self.selectTitleColor = selectTitleColor
        self.selectBackgroundColor = selectBackgroundColor
    }
    
    
}
