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
    public static let SLIDE_MENU_WIDTH:CGFloat = 0.66
    public static let CELL_COUNT_IN_ROW:CGFloat = 4
    
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
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"買咖啡"
            , url:"https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_coffee_n.png?alt=media&token=f4683ece-e009-4706-b052-fb0d68de98cd"),
        FunctionItem(index:1
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"買飲品"
            , url:"https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_water_n.png?alt=media&token=5c88253e-a205-4794-abbb-8c9cc1a7d43c"),
        FunctionItem(index:2
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"買用品"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_paper_n.png?alt=media&token=978b7593-3c4e-4c01-a1b6-7f8a0968b27e"),
        FunctionItem(index:3
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"我的票卷"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_ticketwallet_n.png?alt=media&token=bc730fcb-de4c-4aad-befd-50f162d0b40c"),
        FunctionItem(index:4
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:true
            , text:"HiPay"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_hipay_n.png?alt=media&token=8f05b0f9-d2c8-478c-b6fb-ad7fa0663497"),
        FunctionItem(index:5
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:false
            , text:"最新消息"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_news_n.png?alt=media&token=ecdb1dbb-20ba-4570-aac5-9686e8da561e"),
        FunctionItem(index:6
            , type:ItemType.NATIVE.rawValue
            , isOpenInInternal: true
            , isInMainPage:false
            , text:"會員中心"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_member_n.png?alt=media&token=4563e280-dc9d-4ce0-aa51-d5257f33abd9"),
        FunctionItem(index:7
            , type:ItemType.NATIVE.rawValue
            , isOpenInInternal: true
            , isInMainPage:false
            , text:"我的點數"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_redpoint_n.png?alt=media&token=993c7fe0-6994-4414-9af1-7b353e6a4591"),
        FunctionItem(index:8
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:false
            , text:"買用品"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_paper_n.png?alt=media&token=978b7593-3c4e-4c01-a1b6-7f8a0968b27e"),
        FunctionItem(index:9
            , type:ItemType.LINK.rawValue
            , isOpenInInternal: true
            , isInMainPage:false
            , text:"點數兌換"
            , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_exchange_n.png?alt=media&token=d5b6c73f-9089-41ca-8da7-3b7ad6569001"),
        FunctionItem(index:9
        , type:ItemType.LINK.rawValue
        , isOpenInInternal: true
        , isInMainPage:false
        , text:"Hi ATM"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_hiatm_n.png?alt=media&token=06fc3c8f-1e4d-40db-86df-5502f7e2fa7d"),
        FunctionItem(index:9
        , type:ItemType.LINK.rawValue
        , isOpenInInternal: true
        , isInMainPage:false
        , text:"萊玩遊戲"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_game_n.png?alt=media&token=e53fe89d-2f4c-48d8-bec9-c02a730944cb"),
        FunctionItem(index:9
        , type:ItemType.NATIVE.rawValue
        , isOpenInInternal: true
        , isInMainPage:false
        , text:"萊寄件"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_delivery_n.png?alt=media&token=28e33ff4-de13-4364-844a-f6101a1e67f9"),
        FunctionItem(index:9
        , type:ItemType.LINK.rawValue
        , isOpenInInternal: true
        , isInMainPage:false
        , text:"萊繳費"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_payment.png?alt=media&token=b6a3a246-2fb0-4a5d-9940-c6d01a239224"),
        FunctionItem(index:9
        , type:ItemType.LINK.rawValue
        , isOpenInInternal: true
        , isInMainPage:false
        , text:"萊儲值"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/add_value.png?alt=media&token=831d6561-c9eb-4d0b-9067-ff398e395e24"),
        FunctionItem(index:9
        , type:ItemType.LINK.rawValue
        , isOpenInInternal: false
        , isInMainPage:false
        , text:"雲端超商"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_hilifefridge_n.png?alt=media&token=5db0b68d-e071-4c65-8def-238d3eecf80c"),
        FunctionItem(index:9
        , type:ItemType.LINK.rawValue
        , isOpenInInternal: false
        , isInMainPage:false
        , text:"雲端列印"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/eprint.png?alt=media&token=a330b613-5eee-40f3-9db1-97357d799340"),
        FunctionItem(index:9
        , type:ItemType.NATIVE.rawValue
        , isOpenInInternal: false
        , isInMainPage:false
        , text:"更多服務"
        , url: "https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_more_n.png?alt=media&token=82c997f7-22b0-4069-84f7-be35dbddd252")
    ]
    
}
