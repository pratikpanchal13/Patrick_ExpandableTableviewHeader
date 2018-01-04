//
//  cellExerciseListDetailsExpandable.swift
//  Patrick_ExpandableTableviewHeader
//
//  Created by pratik panchal on 28/12/17.
//  Copyright © 2017 pratik panchal. All rights reserved.
//

import UIKit

class cellExerciseListDetailsExpandable: UITableViewHeaderFooterView { //UITableViewHeaderFooterView

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imgIconbackground: UIImageView!
    @IBOutlet weak var btnstatus: UIButton!
    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var lblTitleHight: NSLayoutConstraint!
    @IBOutlet weak var VWLiney: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
