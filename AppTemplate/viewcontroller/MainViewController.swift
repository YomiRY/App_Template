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
import FSPagerView
import Kingfisher

class MainViewController:UIViewController, FSPagerViewDataSource, FSPagerViewDelegate, IFuncListEventListener {
    
    private static let BANNER_CELL_ID = "cell"
    
    @IBOutlet weak var mBiMemberCard: UIBarButtonItem!
    @IBOutlet weak var mBiSlideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var mNavBar: UINavigationBar!
    @IBOutlet weak var mFpBanner: FSPagerView!
    @IBOutlet weak var mPageIndicator: FSPageControl!
    @IBOutlet weak var mCvFuncList: FunctionCollectionView!
    @IBOutlet weak var mClMainFuncListTopToBannerBottom: NSLayoutConstraint!
    private var mClMainFuncListTopToNavBottom:NSLayoutConstraint?
    
    private var mLeftMenuItemList:Array<LeftMenuItem>?
    private var mIsDispInMainPage:Bool = true
    
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
    func initView() {
        self.mNavBar.barTintColor = UIColor.white
        self.mCvFuncList.listener = self
        
        initBannerPager()
        initSlideMenu()
    }
    
    func initBannerPager() {
        mFpBanner.isInfinite = true
        mFpBanner.automaticSlidingInterval = 2
        mPageIndicator.numberOfPages = Constants.PAGER_IMAGE_URL.count
        mPageIndicator.contentHorizontalAlignment = .center
        //mPageIndicator.hidesForSinglePage = true
        //mPageIndicator.setStrokeColor(.white, for: .normal)
        mPageIndicator.setFillColor(.white, for: .normal)
        //mPageIndicator.setStrokeColor(.red, for: .selected)
        mPageIndicator.setFillColor(.red, for: .selected)
        mPageIndicator.setPath(UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)), for: .selected)
        mPageIndicator.setPath(UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)), for: .normal)
        mPageIndicator.itemSpacing = 20
        
        self.mFpBanner.register(FSPagerViewCell.self, forCellWithReuseIdentifier: MainViewController.BANNER_CELL_ID)
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
        SideMenuManager.default.leftMenuNavigationController?.menuWidth = UIScreen.main.bounds.width * Constants.SLIDE_MENU_WIDTH
        // Setup gestures: the left and/or right menus must be set up (above) for these to work.
        // Note that these continue to work on the Navigation Controller independent of t
        // he view controller it displays!
        // SideMenuManager.default.addPanGestureToPresent(toView:  self.mNavBar)
        // SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view)
    }
    
    func initData() {
        // 側選單資料初始化
        self.mLeftMenuItemList = Array<LeftMenuItem>()
        // Initialize  main item and sub item of left slide menu
        for item in Constants.LEFT_MENU_ITEMS {
            self.mLeftMenuItemList?.append(item)
            
            if item.isMainItem, let subItems = item.subItems {
                for subItem in subItems {
                    self.mLeftMenuItemList?.append(subItem)
                }
            }
        }
        
        // 功能列表初始化
        self.mCvFuncList.mFunctionItemList = Array<FunctionItem>()
        self.mCvFuncList.cellCountInRow = Constants.CELL_COUNT_IN_ROW
        for item in Constants.FUNCTION_ITMES {
            if (self.mIsDispInMainPage && item.isInMainPage!) || !self.mIsDispInMainPage {
                self.mCvFuncList.mFunctionItemList?.append(item)
            }
        }
        if(mIsDispInMainPage) {
            //主頁可視範圍 2 Column
            self.mCvFuncList.cellCountInCol = 2
            // 只取需要顯示在主頁面的
            self.mCvFuncList.mFunctionItemList?.append(FunctionItem(index: 5, type: Constants.ItemType.NATIVE.rawValue, isInMainPage: true, text: "更多功能", url:"https://firebasestorage.googleapis.com/v0/b/nodejs-test-abeae.appspot.com/o/btn_home_all_n.png?alt=media&token=b93f48e2-5230-4830-9b17-57b1b1169469"))
        } else {
            //主頁可視範圍 6 Column
            self.mCvFuncList.cellCountInCol = 6
        }
        self.mCvFuncList.reloadData()
        self.mCvFuncList.updateConstraints()
    }
    
    // MARK:- IFuncListEventListener
    func onClick(funcItem: FunctionItem) {
        if (funcItem.isInMainPage ?? false) && (funcItem.index == 5) {
            // 點選更多功能
            //調整主頁面Function List
            self.mIsDispInMainPage = false
            if self.mClMainFuncListTopToNavBottom == nil {
                self.mClMainFuncListTopToNavBottom = self.mCvFuncList.topAnchor.constraint(equalTo: self.mNavBar.bottomAnchor)
            }
            self.view.removeConstraint(self.mClMainFuncListTopToBannerBottom)
            self.view.addConstraint(self.mClMainFuncListTopToNavBottom!)
        } else {
            // 點選其他功能
            self.mIsDispInMainPage = true
            if self.mClMainFuncListTopToBannerBottom == nil {
                self.mClMainFuncListTopToBannerBottom = self.mCvFuncList.topAnchor.constraint(equalTo: self.mFpBanner.bottomAnchor)
            }
            //調整主頁面Function List
            self.view.addConstraint(self.mClMainFuncListTopToBannerBottom)
            self.view.removeConstraint(self.mClMainFuncListTopToNavBottom!)
        }
        self.view.updateConstraints()
        // 重新刷新功能列表
        initData()
        print("\(#function)")
    }
    
    // MARK:- SlideMenu
    @IBAction func toggleSlideMenu(_ sender: Any) {
        print(#function)
        guard let menuVc = SideMenuManager.default.leftMenuNavigationController else {
            return
        }
        present(menuVc, animated: true, completion: nil)
    }
    
    // MARK:- FSPagerView DataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return Constants.PAGER_IMAGE_URL.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: MainViewController.BANNER_CELL_ID, at: index)
        cell.imageView?.kf.setImage(with: URL(string:Constants.PAGER_IMAGE_URL[index]))
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.mPageIndicator.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.mPageIndicator.currentPage = pagerView.currentIndex
    }
}
