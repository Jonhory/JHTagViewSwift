//
//  JHTagView.swift
//  TagViewDemoForSwift
//
//  Created by Jonhory on 2017/5/3.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

import UIKit

protocol JHTagViewDelegate {
    
    func jh_tagViewClicked(model: JHTagModel, isSelected: Bool)
}

class JHTagView: UIView {

    var delegate: JHTagViewDelegate?
    /// 最大宽度
    public var maxWidth: CGFloat = 0.0
    /// 数据源
    public var tagModels: [JHTagModel] = [] {
        didSet {
            setModels()
        }
    }
    
    /// 标签水平间距
    private var horizontalMargin: CGFloat = 0
    /// 标签垂直间距
    private var verticalMargin: CGFloat = 0
    
    private var singleViews: [JHTagSingleView] = []
    
    private func setModels() {
        if singleViews.count != tagModels.count {
            _ = getMaxHeightWith(models: tagModels)
        }
        for i in 0..<tagModels.count {
            let singleView = singleViews[i]
            addSubview(singleView)
        }
    }
    
    public func getMaxHeightWith(models: [JHTagModel]) -> CGFloat {
        // 前面的X
        var totalWidth: CGFloat = 0
        // 总高度
        var totalHeight: CGFloat = 0
        // 水平方向最大高度
        var horizontalMaxHeight: CGFloat = 0
        
        for i in 0..<models.count {
            let model = models[i]
            
            var tempWidth = model.width
            if tempWidth + totalWidth >= maxWidth {
                tempWidth = maxWidth - totalWidth - 1
            }
            let sframe = CGRect(x: totalWidth, y: totalHeight, width: tempWidth, height: model.height)
            
            let singleView = JHTagSingleView(frame: sframe)
            singleView.model = model
            singleView.delegate = self
            singleView.backgroundColor = self.backgroundColor
            
            singleViews.append(singleView)
            
            totalWidth += singleView.bounds.width + horizontalMargin
            if singleView.bounds.height > horizontalMaxHeight {
                horizontalMaxHeight = singleView.bounds.height
            }
            
            if i+1 < models.count {
                let nextModel = models[i+1]
                if totalWidth + nextModel.width > maxWidth {
                    totalHeight += verticalMargin + horizontalMaxHeight
                    totalWidth = 0
                    horizontalMaxHeight = 0
                }
            }
        }
        
        totalHeight += horizontalMaxHeight
        
        return totalHeight
    }
    
    public func reloadData() {
        for view in subviews {
            view.removeFromSuperview()
        }
        singleViews.removeAll()
        
        let height = getMaxHeightWith(models: tagModels)
        for i in 0..<tagModels.count {
            let singleView = singleViews[i]
            addSubview(singleView)
        }
        // 重置高度
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: height)
    }
    
    public func getSelectedModels() -> [JHTagModel] {
        var selectedModels: [JHTagModel] = []
        for m in tagModels {
            if m.isSelected {
                selectedModels.append(m)
            }
        }
        return selectedModels
    }
    
    /// 快速配置
    ///
    /// - Parameters:
    ///   - maxWidth: 视图最大宽度
    ///   - horizontalMargin: 标签水平间距
    ///   - verticalMargin: 标签垂直间距
    public func config(maxWidth: CGFloat, horizontalMargin: CGFloat, verticalMargin: CGFloat) {
        self.maxWidth = maxWidth
        self.horizontalMargin = horizontalMargin
        self.verticalMargin = verticalMargin
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.maxWidth = frame.width
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension JHTagView: JHTagSingleViewDelegate {
    func jh_tagSingleViewClicked(model: JHTagModel, isSelected: Bool) {
        delegate?.jh_tagViewClicked(model: model, isSelected: isSelected)
    }
}
