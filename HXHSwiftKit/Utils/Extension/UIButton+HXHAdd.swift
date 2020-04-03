//
//  UIButton+HXHAdd.swift
//  HXHSwiftKit
//
//  Created by 黄小豪 on 2020/4/3.
//  Copyright © 2020 黄小豪. All rights reserved.
//

import Foundation
import UIKit

extension UIButton: HXHNameSpaceCompatible{}
extension HXHNameSpace where Base: UIButton {
    
    /// 左文字右图，写在didLayout中才能确定生效
    func leftTextRightImage(space: CGFloat) {
        guard let imgView = base.imageView else { return }
        guard let titlelabel = base.titleLabel else { return }
        let labelWidth = titlelabel.intrinsicContentSize.width
        let imgWidth = imgView.intrinsicContentSize.width
        base.setNeedsLayout()
        base.layoutIfNeeded()
        base.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imgWidth - space/2.0, bottom: 0, right: imgWidth+space/2.0)
        base.imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
    }
    /// 下文字上图，写在didLayout中才能确定生效
    func topImgBottomText(space: CGFloat) {
        
    }
}
    
