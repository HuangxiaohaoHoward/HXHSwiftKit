//
//  HXH.swift
//  HXHSwiftKit
//
//  Created by 黄小豪 on 2020/4/2.
//  Copyright © 2020 黄小豪. All rights reserved.
//

import Foundation


public struct HXHNameSpace<Base> {
    public var base:Base
    public init(base:Base) {
        self.base = base
    }
}

public protocol HXHNameSpaceCompatible {
    associatedtype CompatibleType
    
    //这里为什么不会冲突？
    static var hxh: CompatibleType.Type{get}
    var hxh:CompatibleType{get}
}

public extension HXHNameSpaceCompatible {
    static var hxh: HXHNameSpace<Self>.Type{
        return HXHNameSpace<Self>.self
    }
    var hxh:HXHNameSpace<Self>{
        return HXHNameSpace<Self>(base: self)
    }
}
