//
//  FrameManager.swift
//  HXHSwiftKit
//
//  Created by 黄小豪 on 2020/4/3.
//  Copyright © 2020 黄小豪. All rights reserved.
//

import UIKit

struct Screen {
    static let bounds = UIScreen.main.bounds
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}
let ScreenWidth = Screen.width
let ScreenHeight = Screen.height


let isIphone5  = ScreenHeight == 568 ? true : false
let isIphone6  = ScreenHeight == 667 ? true : false
let isIphone6P = ScreenHeight == 736 ? true : false
let isIphoneX  = ScreenHeight == 812 ? true : false
let isIphoneXR = ScreenHeight == 896 ? true : false
let isIphoneXM = ScreenHeight == 896 ? true : false

// navigation 总高度
let NaviAndStatusHeight: CGFloat = (isIphoneX || isIphoneXR || isIphoneXM) ? 88 : 64
// 状态栏 高度
let StatusBarHeight: CGFloat = (isIphoneX || isIphoneXR || isIphoneXM) ? 44 : 20
// tabbar 总高度
let TabBarTotalHeight: CGFloat = (isIphoneX || isIphoneXR || isIphoneXM) ? 83 : 49
// 底部距离
let TabBarMargin: CGFloat = (isIphoneX || isIphoneXR || isIphoneXM) ? 34 : 0
let NaviMargin: CGFloat = (isIphoneX || isIphoneXR || isIphoneXM) ? 29 : 0
