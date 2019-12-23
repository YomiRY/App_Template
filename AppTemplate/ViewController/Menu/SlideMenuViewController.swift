//
//  SlideMenuViewController.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/20.
//  Copyright © 2019 yomi. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mVLogo: UIView!
    @IBOutlet weak var mIvLogoImage: UIImageView!
    @IBOutlet weak var mVLogoBar: UIView!
    
    @IBOutlet weak var mVQuickMenu: UIView!
    @IBOutlet weak var mTvMenu: UITableView!
    
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
        self.mTvMenu.register(UINib(nibName: "SlideMenuItemCell", bundle: nil), forCellReuseIdentifier: "slide_menu_item_cell")
    }
    
    // MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "slide_menu_item_cell") as? SlideMenuItemCell else {
            fatalError("Cell is not of kind SlideMenuItemCell")
        }
        cell.selectionStyle = .none
        cell.mLbLabel.text = indexPath.row.description
        return cell
    }
    
    // MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(#function)")
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
