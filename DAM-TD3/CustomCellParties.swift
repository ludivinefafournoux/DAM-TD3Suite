//
//  CustomCellParties.swift
//  DAM-TD3
//
//  Created by COMET Maxime on 25/01/2017.
//  Copyright © 2017 Ludivine. All rights reserved.
//

import UIKit

class CustomCellParties: UITableViewCell {

    
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var flyerOutlet: UIImageView!
    @IBOutlet weak var dateOutlet: UILabel!
    @IBOutlet weak var hourOutlet: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
