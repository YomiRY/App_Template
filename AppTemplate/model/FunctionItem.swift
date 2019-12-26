//
//  FunctionItem.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/25.
//  Copyright © 2019 yomi. All rights reserved.
//

import Foundation

class FunctionItem {
    var index:Int?
    var type:String?
    var isOpenInInternal:Bool?
    var isInMainPage:Bool?
    var text:String?
    var url:String?
    var data:[String:Any]?
    
    init(index:Int?
        , type:String? = "LINK"
        , isOpenInInternal:Bool? = false
        , isInMainPage:Bool? = false
        , text:String?
        , url:String? = nil
        , data:[String:String]? = nil) {
        self.index = index
        self.type = type
        self.isOpenInInternal = isOpenInInternal
        self.isInMainPage = isInMainPage
        self.text = text
        self.url = url
        self.data = data
    }
}
