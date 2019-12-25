//
//  Constants.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/24.
//  Copyright © 2019 yomi. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    public static let FUNC_ICON_SIZE:CGFloat = 20
    
    enum ItemType:String {
        case LINK = "LINK"
        case NATIVE = "NATIVE";
    }
    
    // TODO: Fake data
    public static let LEFT_MENU_ITEMS:[LeftMenuItem] = [
        LeftMenuItem(index:0, type:ItemType.LINK.rawValue, isOpenInInternal:true, isMainItem:true, text:"最新消息", url:"https://www.google.com.tw"),
        LeftMenuItem(index:1, type:ItemType.LINK.rawValue, isOpenInInternal:true, isMainItem:true, text:"HiPay", url:"https://www.yahoo.com.tw"),
        LeftMenuItem(index:2, type:ItemType.NATIVE.rawValue, isMainItem:true, text:"我的票卷", subItems: [
            LeftMenuItem(index:0, type:ItemType.NATIVE.rawValue, isMainItem:false, text:"超值購票券匣"),
            LeftMenuItem(index:1, type:ItemType.NATIVE.rawValue, isMainItem:false, text:"紅利點數兌換票券匣"),
            LeftMenuItem(index:2, type:ItemType.NATIVE.rawValue, isMainItem:false, text:"Hi-Coupon票券匣"),
            LeftMenuItem(index:3, type:ItemType.NATIVE.rawValue, isMainItem:false, text:"待繳費票券匣"),
        ]),
        LeftMenuItem(index:3, type:ItemType.NATIVE.rawValue, isMainItem:true, text:"我的點數", subItems: [
            LeftMenuItem(index:0, type:ItemType.NATIVE.rawValue, isMainItem:false, text:"點數查詢"),
            LeftMenuItem(index:1, type:ItemType.NATIVE.rawValue, isMainItem:false, text:"點數兌換"),
            LeftMenuItem(index:2, type:ItemType.NATIVE.rawValue, isMainItem:false, text:"點數贈送"),
        ]),
        LeftMenuItem(index:4, type:ItemType.LINK.rawValue, isOpenInInternal:true, isMainItem:true, text:"寄件服務", url:"https://www.yahoo.com.tw"),
        LeftMenuItem(index:5, type:ItemType.LINK.rawValue, isOpenInInternal:true, isMainItem:true, text:"閱讀起步走", url:"https://www.yahoo.com.tw"),
        LeftMenuItem(index:6, type:ItemType.NATIVE.rawValue, isMainItem:true, text:"關於我們"),
        LeftMenuItem(index:7, type:ItemType.NATIVE.rawValue, isMainItem:true, text:"推播設定"),
    ]
    
    public static let PAGER_IMAGE_URL = ["https://shopee.tw/blog/wp-content/uploads/2019/10/%E9%9B%9911%E6%9A%96%E8%BA%AB%E6%94%BB%E7%95%A5%E6%96%87.jpg", "https://content.shopback.com/tw/wp-content/uploads/2019/10/18112135/costco-bf-2019.png",
                                             "https://pic.pimg.tw/lovefree365/1575028521-1519346761_wn.jpg",
                                             "https://www.ikea.com.tw/dairyfarm/tw/uploader/image/1575283790_178.jpg", "https://shopee.tw/blog/wp-content/uploads/2019/10/%E9%9B%9911%E6%9A%96%E8%BA%AB%E6%94%BB%E7%95%A5%E6%96%87.jpg", "https://content.shopback.com/tw/wp-content/uploads/2019/10/18112135/costco-bf-2019.png",
                                             "https://pic.pimg.tw/lovefree365/1575028521-1519346761_wn.jpg",
                                             "https://www.ikea.com.tw/dairyfarm/tw/uploader/image/1575283790_178.jpg"]
    
    public static let FUNCTION_ITMES:[FunctionItem] = [
        FunctionItem(index:0
            , type:"LINK"
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"買咖啡"
            , url:"https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_coffee_n.png?alt=media&token=f4683ece-e009-4706-b052-fb0d68de98cd"),
        FunctionItem(index:0
            , type:"LINK"
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"買飲品"
            , url:"https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_water_n.png?alt=media&token=5c88253e-a205-4794-abbb-8c9cc1a7d43c"),
        FunctionItem(index:0
            , type:"LINK"
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"買用品"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_paper_n.png?alt=media&token=978b7593-3c4e-4c01-a1b6-7f8a0968b27e"),
        FunctionItem(index:0
            , type:"LINK"
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"我的票卷"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_ticketwallet_n.png?alt=media&token=bc730fcb-de4c-4aad-befd-50f162d0b40c"),
        FunctionItem(index:0
            , type:"LINK"
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"HiPay"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_hipay_n.png?alt=media&token=8f05b0f9-d2c8-478c-b6fb-ad7fa0663497")
    ]
    
}
