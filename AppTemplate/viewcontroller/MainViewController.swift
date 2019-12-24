//
//  MainViewController.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/20.
//  Copyright © 2019 yomi. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class MainViewController:UIViewController  {
    
    @IBOutlet weak var mBiMemberCard: UIBarButtonItem!
    @IBOutlet weak var mBiSlideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var mNavBar: UINavigationBar!
    
    private var mLeftMenuItemList:Array<LeftMenuItem>?
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        print(#function)
        initData()
        initView()
    }
    
    override func viewDidLayoutSubviews() {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {}
    
    // MARK:- Initialization
    func initData() {
        self.mLeftMenuItemList = Array<LeftMenuItem>()
        
        for item in Constants.LEFT_MENU_ITEMS {
            self.mLeftMenuItemList?.append(item)
            
            if item.isMainItem, let subItems = item.subItems {
                for subItem in subItems {
                    self.mLeftMenuItemList?.append(subItem)
                }
            }
        }
    }
    
    func initView() {
        mNavBar.barTintColor = UIColor.white
        initSlideMenu()
    }
    
    // MARK:- SlideMenu
    @IBAction func toggleSlideMenu(_ sender: Any) {
        print(#function)
        guard let menuVc = SideMenuManager.default.leftMenuNavigationController else {
            return
        }
        present(menuVc, animated: true, completion: nil)
    }
    
    func initSlideMenu() {
        var style = SideMenuPresentationStyle()
        style = .viewSlideOutMenuIn
        style.backgroundColor = .clear
        style.onTopShadowOpacity = 0.5
        style.onTopShadowRadius = 5
        style.onTopShadowColor = .black
        style.menuOnTop = true
                
        var settings = SideMenuSettings()
        settings.presentationStyle = style
    
        SideMenuManager.default.leftMenuNavigationController = SlideMenuNavViewController(menuItemList: self.mLeftMenuItemList)
        SideMenuManager.default.leftMenuNavigationController?.settings = settings
        // (Optional) Prevent status bar area from turning black when menu appears:
        SideMenuManager.default.leftMenuNavigationController?.statusBarEndAlpha = 0
        SideMenuManager.default.leftMenuNavigationController?.navigationBar.isHidden = true
        SideMenuManager.default.leftMenuNavigationController?.menuWidth = UIScreen.main.bounds.width * 0.66
        // Setup gestures: the left and/or right menus must be set up (above) for these to work.
        // Note that these continue to work on the Navigation Controller independent of t
        // he view controller it displays!
        SideMenuManager.default.addPanGestureToPresent(toView:  self.mNavBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view)
    }
}
