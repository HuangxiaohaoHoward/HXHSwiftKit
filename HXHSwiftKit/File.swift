//
//  File.swift
//  HXHSwiftKit
//
//  Created by 黄小豪 on 2020/4/4.
//  Copyright © 2020 黄小豪. All rights reserved.
//

import Foundation
import ObjectMapper
//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
//import ObjectMapper


class RootClass : Mappable{

    var greeting : String?
    var instructions : [String]?
    
    required init?(map: Map){}


    func mapping(map: Map)
    {
        greeting <- map["greeting"]
        instructions <- map["instructions"]
        
    }


}
