//
//  FunctionCollectionView.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/25.
//  Copyright © 2019 yomi. All rights reserved.
//

import UIKit
import Kingfisher

class FunctionCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private static let FUNCTION_ITEM_NIB_NAME = "FunctionItemCell"
    private static let CELL_COUNT_IN_ROW:Int = 4
    private static let CELL_ID = "function_cell"
    
    var mFunctionItemList:Array<FunctionItem>?
    // FIXME: 做到此
//    var listener:IFunctionEventListener?
    
//    protocol IFunctionListEventListener {
//        func onClick(parameters) -> <#return type#> {
//        function body
//        }
//    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout:layout)
        initView()
    }
    
    private func initView() {
        self.dataSource = self
        self.delegate = self
        
        self.register(UINib(nibName: FunctionCollectionView.FUNCTION_ITEM_NIB_NAME, bundle: nil), forCellWithReuseIdentifier: FunctionCollectionView.CELL_ID)
    }

    // MARK:- UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mFunctionItemList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FunctionCollectionView.CELL_ID, for: indexPath) as? FunctionItemCell, let itemList = self.mFunctionItemList else {
            fatalError("Cell is not of kind SlideMenuItemCell or itemList is nil")
        }
    
        let item = itemList[indexPath.row]
        cell.mLbText.text = item.text
        cell.mLbText.textColor = UIColor.black
        let iconW = Constants.FUNC_ICON_SIZE * UIScreen.main.scale
        let iconH = Constants.FUNC_ICON_SIZE * UIScreen.main.scale
        cell.mIvIcon.kf.setImage(with: URL(string:item.url ?? ""), options: [.processor(ResizingImageProcessor(referenceSize: CGSize(width:iconW , height:iconH)))])
        return cell
    }
    
    // MARK:- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // FIXME: Not Implemented
    }
    
    // MARK:- UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 4), height: (collectionView.frame.size.height / 2))
    }
}
