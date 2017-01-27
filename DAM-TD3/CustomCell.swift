//
//  CustomCell.swift
//  DAM-TD3
//
//  Created by Jonathan on 16/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var favicon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var url: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
