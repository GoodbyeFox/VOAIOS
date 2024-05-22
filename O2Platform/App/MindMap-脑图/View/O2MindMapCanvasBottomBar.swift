//
//  O2MindMapCanvasBottomBar.swift
//  O2Platform
//
//  Created by FancyLou on 2021/12/30.
//  Copyright © 2021 zoneland. All rights reserved.
//

import UIKit
import CocoaLumberjack
import RxCocoa

enum O2MindMapCanvasBottomBtnType: String {
    case createSubNode = "Sub" // 创建下级
    case createSameLevelNode = "Same" // 创建同级
    case editNode = "Edit" // 编辑
    case deleteNode = "Del" // 删除
    case addIcon = "Icon" // 添加图标 进度图标 优先级图标
    case addImg =  "Pic" // 添加图片
    case addLink = "Link" // 添加超链接
}

protocol O2MindMapCanvasBottomBtnDelegate {
    func clickBtn(type: O2MindMapCanvasBottomBtnType)
}

/// 脑图画布 底部工具栏
class O2MindMapCanvasBottomBar: UIView {

    class func newBar(y: CGFloat) -> O2MindMapCanvasBottomBar {
        let bar = O2MindMapCanvasBottomBar()
        bar.frame = CGRect(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: O2MindMapCanvasBottomBar.bottomBarHeight)
        bar.backgroundColor = .clear
        return bar
    }
    
    
    static let bottomBarHeight:CGFloat = 48
    private let btnWidth:CGFloat = 90
    private let btnGap:CGFloat = 8
    private let btnHeight:CGFloat = 36
    private var myScollView: UIScrollView? = nil
    private var isRoot = false
    private let rootBtns: [O2MindMapCanvasBottomBtnType] = [.createSubNode, .editNode , .addImg, .addIcon, .addLink]
    private let nodeBtns: [O2MindMapCanvasBottomBtnType] = [.createSubNode, .createSameLevelNode, .editNode, .deleteNode, .addImg, .addIcon, .addLink]
    
    
    var delegate: O2MindMapCanvasBottomBtnDelegate? = nil
    
    func show(isRoot: Bool) {
        self.isRoot = isRoot
        self.loadBtns()
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.y = SCREEN_HEIGHT - safeAreaTopHeight - 10 - O2MindMapCanvasBottomBar.bottomBarHeight
        } completion: { finish in
            DDLogDebug("show is finish。。。。。。。。。。\(finish)")
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.y = SCREEN_HEIGHT
        } completion: { finish in
            DDLogDebug("hide is finish。。。。。。。。。。\(finish)")
        }
    }
    
    // 初始化滚动View
    func initScollView() {
        self.myScollView = UIScrollView()
        let y:CGFloat = (O2MindMapCanvasBottomBar.bottomBarHeight - btnHeight) / 2
        self.myScollView!.frame = CGRect(x: 0, y: y, width: self.frame.width, height: btnHeight)
        self.myScollView!.contentSize = CGSize(width: (btnWidth + btnGap) * 7, height: btnHeight)
        self.myScollView?.showsVerticalScrollIndicator = false
        self.myScollView?.showsHorizontalScrollIndicator = false
        self.myScollView?.alwaysBounceHorizontal = true
        self.myScollView?.alwaysBounceVertical = false
        self.myScollView?.delegate = self
        self.addSubview(self.myScollView!)
    }
    
    
    private func loadBtns() {
        if self.myScollView == nil {
            self.initScollView()
        } else {
            self.myScollView?.removeSubviews()
        }
        if self.isRoot {
            self.myScollView!.contentSize = CGSize(width: (btnWidth + btnGap) * CGFloat(self.rootBtns.count), height: btnHeight)
            var i = 0
            for item in self.rootBtns {
                let btn = UIButton()
                btn.frame = CGRect(x: CGFloat(btnWidth + btnGap) * CGFloat(i) + btnGap, y: 0, width: btnWidth, height: btnHeight)
                btn.setTitle(item.rawValue, for: .normal)
                btn.setImage(self.btnIcon(type: item), for: .normal)
                btn.setBackgroundColor(.white, forState: .normal)
                btn.setTitleColor(.black, for: .normal)
                btn.cornerRadius = 4 // roundedCorners(cornerRadius: 4, borderWidth: 1, borderColor: .black)
                btn.addShadow(offset: CGSize(width: 5, height: 5), radius: 4, color: .black, opacity: 0.7, cornerRadius: 4)
                btn.tag = i
                self.myScollView?.addSubview(btn)
                btn.addTapGesture { recg in
                    if let bt = recg.view as? UIButton {
                        self.clickBtn(tag: bt.tag)
                    }
                }
                i += 1
            }
        } else {
            self.myScollView!.contentSize = CGSize(width: (btnWidth + btnGap) * CGFloat(self.nodeBtns.count), height: btnHeight)
            var i = 0
            for item in self.nodeBtns {
                let btn = UIButton()
                btn.frame = CGRect(x: CGFloat(btnWidth + btnGap) * CGFloat(i) + btnGap, y: 0, width: btnWidth, height: btnHeight)
                btn.setTitle(item.rawValue, for: .normal)
                btn.setImage(self.btnIcon(type: item), for: .normal)
                btn.setBackgroundColor(.white, forState: .normal)
                btn.setTitleColor(.black, for: .normal)
                btn.cornerRadius = 4 // roundedCorners(cornerRadius: 4, borderWidth: 1, borderColor: .black)
                btn.addShadow(offset: CGSize(width: 5, height: 5), radius: 4, color: .black, opacity: 0.7, cornerRadius: 4)
                btn.tag = i
                self.myScollView?.addSubview(btn)
                btn.addTapGesture { recg in
                    if let bt = recg.view as? UIButton {
                        self.clickBtn(tag: bt.tag)
                    }
                }
                i += 1
            }
        }
    }
    //
    private func btnIcon(type: O2MindMapCanvasBottomBtnType)-> UIImage? {
        switch type {
        case .createSubNode:
            return UIImage(named: "icon_xiaji")
        case .createSameLevelNode:
            return UIImage(named: "icon_tongji")
        case .editNode:
            return UIImage(named: "icon_bianji_mind")
        case .deleteNode:
            return UIImage(named: "icon_delete")
        case .addIcon:
            return UIImage(named: "icon_icon")
        case .addImg:
            return UIImage(named: "icon_picture")
        case .addLink:
            return UIImage(named: "icon_chaolianjie")
        }
    }
    
    private func clickBtn(tag: Int) {
        var type: O2MindMapCanvasBottomBtnType? = nil
        if self.isRoot {
            type = self.rootBtns[tag]
        } else {
            type = self.nodeBtns[tag]
        }
        if let type = type {
            DDLogDebug("点击了按钮： \(type.rawValue)")
            self.delegate?.clickBtn(type: type)
        }
    }
    
}

extension O2MindMapCanvasBottomBar: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
