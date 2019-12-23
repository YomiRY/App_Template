//
//  SlideMenuItemCell.swift
//  AppTemplate
//
//  Created by yomi on 2019/12/20.
//  Copyright © 2019 yomi. All rights reserved.
//

import UIKit

class SlideMenuItemCell: UITableViewCell {
    
    @IBOutlet weak var mLbLabel: UILabel!
    @IBOutlet weak var mIvImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
