//
//  SlideMenuViewController.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/20.
//  Copyright © 2019 yomi. All rights reserved.
//

import UIKit
import SideMenu

class SlideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private static let SLIDE_MENU_NIB_NAME = "SlideMenuItemCell"
    private static let CELL_ID = "slide_menu_item_cell"
    
    @IBOutlet weak var mVLogo: UIView!
    @IBOutlet weak var mIvLogoImage: UIImageView!
    @IBOutlet weak var mVLogoBar: UIView!
    @IBOutlet weak var mVQuickMenu: UIView!
    @IBOutlet weak var mTvMenu: UITableView!
    
    var mMenuItemList:Array<LeftMenuItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
    }
    
    func initView() {
        self.mVLogo.backgroundColor = UIColor.white
        self.mVLogoBar.backgroundColor = UIColor.red
        self.mTvMenu.dataSource = self
        self.mTvMenu.delegate = self
        self.mTvMenu.rowHeight = UITableView.automaticDimension
        self.mTvMenu.estimatedRowHeight = 30
        self.mTvMenu.register(UINib(nibName: SlideMenuViewController.SLIDE_MENU_NIB_NAME, bundle: nil), forCellReuseIdentifier: SlideMenuViewController.CELL_ID)
    }
    
    // MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mMenuItemList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SlideMenuViewController.CELL_ID) as? SlideMenuItemCell, let itemList = self.mMenuItemList else {
            fatalError("Cell is not of kind SlideMenuItemCell")
        }
        let menuItem = itemList[indexPath.row]
        cell.selectionStyle = .none
        cell.mLbLabel.text = menuItem.text
        cell.mLbLabel.textColor = UIColor.black
        cell.mClLeftMargin.constant = 60
        if(!menuItem.isMainItem) {
            cell.mLbLabel.textColor = UIColor(displayP3Red: 135 / 255, green: 135 / 255, blue: 135 / 255, alpha: 1.0)
            cell.mClLeftMargin.constant = 80
        }
        
        return cell
    }
    
    // MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(#function)")
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
