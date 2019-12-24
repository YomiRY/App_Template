//
//  Constants.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/24.
//  Copyright © 2019 yomi. All rights reserved.
//

import Foundation

class Constants {
    public static let LEFT_MENU_ITEMS:[LeftMenuItem] = [
        LeftMenuItem(index:0, type:"LINK", isOpenInInternal:true, isMainItem:true, text:"最新消息", url:"https://www.google.com.tw"),
        LeftMenuItem(index:1, type:"LINK", isOpenInInternal:true, isMainItem:true, text:"HiPay", url:"https://www.yahoo.com.tw"),
        LeftMenuItem(index:2, type:"NATIVE", isMainItem:true, text:"我的票卷", subItems: [
            LeftMenuItem(index:0, type:"NATIVE", isMainItem:false, text:"超值購票券匣"),
            LeftMenuItem(index:1, type:"NATIVE", isMainItem:false, text:"紅利點數兌換票券匣"),
            LeftMenuItem(index:2, type:"NATIVE", isMainItem:false, text:"Hi-Coupon票券匣"),
            LeftMenuItem(index:3, type:"NATIVE", isMainItem:false, text:"待繳費票券匣"),
        ]),
        LeftMenuItem(index:3, type:"NATIVE", isMainItem:true, text:"我的點數", subItems: [
            LeftMenuItem(index:0, type:"NATIVE", isMainItem:false, text:"點數查詢"),
            LeftMenuItem(index:1, type:"NATIVE", isMainItem:false, text:"點數兌換"),
            LeftMenuItem(index:2, type:"NATIVE", isMainItem:false, text:"點數贈送"),
        ]),
        LeftMenuItem(index:1, type:"LINK", isOpenInInternal:true, isMainItem:true, text:"寄件服務", url:"https://www.yahoo.com.tw"),
        LeftMenuItem(index:1, type:"LINK", isOpenInInternal:true, isMainItem:true, text:"閱讀起步走", url:"https://www.yahoo.com.tw"),
        LeftMenuItem(index:1, type:"NATIVE", isMainItem:true, text:"關於我們"),
        LeftMenuItem(index:1, type:"NATIVE", isMainItem:true, text:"推播設定"),
        
    ]
    
}
