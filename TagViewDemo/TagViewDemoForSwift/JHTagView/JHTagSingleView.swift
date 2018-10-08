//
//  JHTagSingleView.swift
//  TagViewDemoForSwift
//
//  Created by Jonhory on 2017/5/3.
//  Copyright © 2017年 com.wujh. All rights reserved.
//

import UIKit

protocol JHTagSingleViewDelegate: class {

    func jh_tagSingleViewClicked(model: JHTagModel, isSelected: Bool)
}

class JHTagSingleView: UIView {

    var delegate: JHTagSingleViewDelegate?
    
    var model: JHTagModel? { didSet { setModel() } }
    
    private let tagBtn = UIButton(type: .custom)
    
    private func setModel() {
        if model == nil { return }
        
        tagBtn.setTitle(model?.text, for: .normal)
        tagBtn.titleLabel?.font = model?.font
        tagBtn.setTitleColor(model?.normalTitleColor, for: .normal)
        tagBtn.setTitleColor(model?.selectTitleColor, for: .selected)
        
        tagBtn.layer.cornerRadius = model!.cornerRadius
        tagBtn.layer.borderWidth = model!.borderWidth
        tagBtn.layer.masksToBounds = true
        
        tagBtn.isSelected = model!.isSelected
        tagBtn.adjustsImageWhenHighlighted = false
        
        handleBtnIsSelected(tagBtn)
    }
    
    func tagBtnClicked(_ btn: UIButton) {
        if model == nil { return }
        
        if model!.isAbleToSelect {
            btn.isSelected = !btn.isSelected
            model!.isSelected = !model!.isSelected
            handleBtnIsSelected(btn)
        }
        delegate?.jh_tagSingleViewClicked(model: model!, isSelected: btn.isSelected)
    }
    
    private func handleBtnIsSelected(_ btn: UIButton) {
        if btn.isSelected {
            btn.backgroundColor = model?.selectBackgroundColor
            btn.layer.borderColor = model?.selectBorderColor.cgColor
        } else {
            btn.backgroundColor = model?.normalBackgroundColor
            btn.layer.borderColor = model?.normalBorderColor.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setContentContainer()
    }

    private func setContentContainer() {
        addSubview(tagBtn)
        
        tagBtn.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        tagBtn.addTarget(self, action: #selector(tagBtnClicked(_:)), for: .touchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
