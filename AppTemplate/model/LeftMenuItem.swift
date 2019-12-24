//
//  LeftMenuItem.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/24.
//  Copyright © 2019 yomi. All rights reserved.
//

import Foundation

class LeftMenuItem {
    var index:Int?
    var type:String?
    var isOpenInInternal:Bool?
    var isMainItem:Bool
    var text:String?
    var url:String?
    var data:[String:Any]?
    var subItems:[LeftMenuItem]?
    
    init(index:Int?
        , type:String? = "LINK"
        , isOpenInInternal:Bool? = false
        , isMainItem:Bool = false
        , text:String?
        , url:String? = nil
        , data:[String:String]? = nil
        , subItems:[LeftMenuItem]? = nil) {
        self.index = index
        self.type = type
        self.isOpenInInternal = isOpenInInternal
        self.isMainItem = isMainItem
        self.text = text
        self.url = url
        self.data = data
        self.subItems = subItems
    }
}
